yaml_dir = File.join(__dir__, "situations")

yaml_slugs = Dir.glob(File.join(yaml_dir, "*.{yml,yaml}")).map { |f| YAML.load_file(f)["slug"] }
Situation.where.not(slug: yaml_slugs).destroy_all

Dir.glob(File.join(yaml_dir, "*.{yml,yaml}")).sort.each do |file|
  data = YAML.load_file(file)

  # find_or_initialize_by : 条件を指定して初めの1件を取得し1件もなければ作成
  situation = Situation.find_or_initialize_by(slug: data["slug"])
  situation.assign_attributes(
    title:     data["title"],
    overview:  data["overview"],
    scenario:  data["scenario"],
    thumbnail: data["thumbnail"]
  )
  situation.save!

  yaml_step_numbers = (data["steps"] || []).map { |s| s["step_number"] }
  db_step_numbers   = situation.steps.pluck(:step_number)
  # Rubyで差集合（ある配列から別の配列に含まれる要素を取り除いたもの）を求めるには、- 演算子を使用します。
  # 左側の配列から、右側の配列に存在する要素をすべて削除した新しい配列を返します
  step_diffs = db_step_numbers - yaml_step_numbers

  # ymlとDBに差異があれば反映
  situation.steps.where(step_number: step_diffs).destroy_all

  # data["steps"] が nil（キーが存在しない等）→ [] を代わりに使う
  (data["steps"] || []).each do |step_data|
    step = situation.steps.find_or_initialize_by(step_number: step_data["step_number"])
    step.body = step_data["body"]
    step.save!

    # stepと同じく削除
    yaml_choice_bodies = (step_data["choices"] || []).map { |c| c["body"] }
    db_choice_bodies   = step.choices.pluck(:body)
    choice_diffs = db_choice_bodies - yaml_choice_bodies
    step.choices.where(body: choice_diffs).destroy_all

    (step_data["choices"] || []).each do |choice_data|
      choice = step.choices.find_or_initialize_by(body: choice_data["body"])
      choice.assign_attributes(
        feedback:   choice_data["feedback"],
        is_correct: choice_data["is_correct"]
      )
      choice.save!
    end
  end
end
