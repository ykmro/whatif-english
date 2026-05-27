# 冪等性を保つため、実行前にデータをクリア
Choice.destroy_all
Step.destroy_all
Situation.destroy_all

# ============================================================
# Situation: 銀河鉄道に乗り合わせた時に使える英会話
# ============================================================

situation = Situation.create!(
  title: "銀河鉄道に乗り合わせた時に使える英会話",
  overview: "宮沢賢治が描いた幻想の世界「イーハトーブ」を舞台に、銀河鉄道での旅を通して英会話を学びます。",
  scenario: "ジョバンニは貧しい家庭に育つ少年。お祭りの夜、丘の上で空を眺めていると突然、目の前に銀河鉄道が現れる。乗り込むと、同じクラスの友達カンパネルラが座っていた。二人は銀河の果てを目指す幻想的な旅へと出発する。",
  thumbnail: "top/situation_thum_galaxy.png"
)

# --- STEP 1 ---
step1 = situation.steps.create!(
  step_number: 1,
  body: '銀河を走る列車の車窓から、ジョバンニは広大な星空を眺めています。隣に座るカンパネルラに思わず声をかけます。<br>「こんな景色、見たことない。本当に綺麗だ。」と言いたい時に適切なフレーズを選びましょう。'
)

step1.choices.create!([
  {
    body: "I've never seen anything like this. It's beautiful.",
    is_correct: true,
    feedback: '「こんな景色、見たことない。本当に綺麗だ。」<br>"I\'ve never seen anything like this" は現在完了の否定形で、「これに類するものを一度も見たことがない」という経験の未体験を表します。"anything like this" が「これに類するようなもの」というニュアンスで、比較の余地すら排除する強調表現です。"It\'s beautiful" の短さが、言葉を失った感動をかえってよく表しています。'
  },
  {
    body: 'The stuff that dreams are made of.',
    is_correct: false,
    feedback: '「これは夢の材料でできている。」<br>映画『マルタの鷹』でハンフリー・ボガートが放った名台詞で、元はシェイクスピアの『テンペスト』に由来します。幻想的な銀河鉄道の旅にはぴったりの詩情ですが、カンパネルラへの感嘆の言葉としてはやや文学的すぎるかもしれません。'
  },
  {
    body: 'I see stars.',
    is_correct: false,
    feedback: '「星が見える」または「目がチカチカする」<br>"I see stars" は直訳すると「星が見える」ですが、英語では頭を強打した後に「目から火花が散る」状態を表す慣用表現でもあります。銀河列車の星空を前にして使うと、ジョバンニが何かに頭をぶつけたように聞こえるかもしれません。'
  }
])

# --- STEP 2 ---
step2 = situation.steps.create!(
  step_number: 2,
  body: '停車した駅で、同乗していた姉弟が「ここで降ります」と立ち上がります。まだ旅の途中なのに、と不思議に思ったジョバンニは思わず声をかけます。<br>「ここが終点じゃないですよね？」と言いたい時に適切なフレーズを選びましょう。'
)

step2.choices.create!([
  {
    body: "This isn't the last stop, is it?",
    is_correct: true,
    feedback: '「ここが終点じゃないですよね？」<br>"This isn\'t the last stop, is it?" は付加疑問文（tag question）の形で、「〜ですよね？」という確認のニュアンスを添えます。"last stop" は「終点・最終停車駅」を意味する自然な表現です。付加疑問を省いて "This isn\'t the last stop." だけでも通じますが、"is it?" を加えることで相手への問いかけ感が生まれます。'
  },
  {
    body: "All those moments will be lost in time, like tears in rain.",
    is_correct: false,
    feedback: '「あの瞬間はすべて、雨の中の涙のように、時の彼方に消えてしまうだろう。」<br>映画『ブレードランナー』でルトガー・ハウアー演じるレプリカントが死の直前に語る名台詞です。銀河鉄道の旅で命尽きようとする乗客への言葉としては、あまりにも詩的すぎます。'
  },
  {
    body: "Get off my plane!",
    is_correct: false,
    feedback: '「私の飛行機から降りろ！」<br>映画『エア・フォース・ワン』でハリソン・フォード演じる大統領が放った名台詞です。乗り物つながりではありますが、降りようとしている人に向かって「降りろ！」と怒鳴るのは文脈が逆です。なお、ここは飛行機ではなく銀河鉄道です。'
  }
])

# --- STEP 3 ---
step3 = situation.steps.create!(
  step_number: 3,
  body: 'カンパネルラが静かに立ち上がり「僕はここで降りなければならない」と言い出します。ジョバンニはとっさに引き止めようとします。<br>「一緒に来てくれ。まだ旅は終わっていない。」と言いたい時に適切なフレーズを選びましょう。'
)

step3.choices.create!([
  {
    body: "Come with me. The journey isn't over yet.",
    is_correct: true,
    feedback: '「一緒に来てくれ。まだ旅は終わっていない。」<br>"Come with me" はシンプルかつ直接的な誘いの命令形です。"The journey isn\'t over yet" の "yet" が「まだ〜していない」という未完了を強調し、諦めたくない気持ちを込めています。感情を飾らず言葉を絞ることで、かえって切迫感が伝わります。'
  },
  {
    body: "I'll be back.",
    is_correct: false,
    feedback: '「また戻ってくる。」<br>映画『ターミネーター』でシュワルツェネッガーが放つ伝説の一言です。文脈としては「去る側」が「戻る」と宣言する台詞なので、引き止めようとするジョバンニには不適切です。また、カンパネルラが戻ってこないことは読者には分かっています。'
  },
  {
    body: "Take me with you.",
    is_correct: false,
    feedback: '「一緒に連れて行ってくれ。」<br>意味は通じますが、カンパネルラについてジョバンニが「自分を連れて行ってほしい」と求める表現です。引き止めたいのに「連れて行ってくれ」では、意図が逆になっています。感情が高ぶっているジョバンニが思わず口にしてしまいそうな選択肢でもあります。'
  }
])

# --- STEP 4 ---
step4 = situation.steps.create!(
  step_number: 4,
  body: 'カンパネルラが消えた後、列車の中にひとり残されたジョバンニ。白い帽子をかぶった車掌が通りかかったので、声をかけます。<br>「この列車の終点はどこですか？」と言いたい時に適切なフレーズを選びましょう。'
)

step4.choices.create!([
  {
    body: "Where is this train headed?",
    is_correct: true,
    feedback: '「この列車の終点はどこですか？」<br>"Where is ~ headed?" は「〜はどこへ向かっていますか？」という自然な問いかけです。"final destination" より口語的で、乗り物にも人にも広く使えます。"this train" を主語にすることで、自分の行き先が分からない不安感が言葉ににじみます。'
  },
  {
    body: "Roads? Where we're going, we don't need roads.",
    is_correct: false,
    feedback: '「道？これから行くところに道は要らない。」<br>映画『バック・トゥ・ザ・フューチャー』でドク・ブラウンが放つ名台詞です。乗り物で未知の場所へ向かう場面として完璧にはまっていますが、ジョバンニは終点を聞いているのであって、宣言しているわけではありません。'
  },
  {
    body: "Is this the final stop?",
    is_correct: false,
    feedback: '「ここが終点ですか？」<br>"final stop" は「最終停車駅」を意味する自然な表現ですが、"Is this ~?" と現在の場所について聞いているので「今いるここが終点か」という意味になります。ジョバンニが知りたいのは「終点がどこか」であり、今いる場所が終点かどうかではありません。'
  }
])

puts "Seed data created successfully!"
puts "Situations: #{Situation.count}"
puts "Steps: #{Step.count}"
puts "Choices: #{Choice.count}"
