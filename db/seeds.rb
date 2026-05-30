# 冪等性を保つため、実行前にデータをクリア
WordChoice.destroy_all
Choice.destroy_all
Step.destroy_all
Situation.destroy_all

# ============================================================
# Situation 1: 現地で体調を崩したときに使える英会話
# ============================================================

situation = Situation.create!(
  title: "現地で体調を崩したときに使える英会話",
  overview: "海外旅行中に体調が悪くなったときに使える英会話を学びます。",
  scenario: "海外旅行中に急に熱と吐き気に襲われました。近くに病院を探し、症状を伝え、救急車を呼ぶ必要があるかもしれません。",
  thumbnail: "top/situation_thum_sick.png"
)

# === センテンス1: I think I have a fever. ===

step = situation.steps.create!(step_number: 1, body: '「熱」を英語で言うと？')
step.choices.create!([
  { body: 'fever', is_correct: true, feedback: '正解！「熱」は <b>fever</b> です。体温が上がった状態を指します。"temperature" も「体温」という意味で使えますが、"have a fever" が発熱の定番表現です。' },
  { body: 'cold', is_correct: false, feedback: '惜しい！「熱」は <b>fever</b> です。"cold" は「風邪」の意味になります。' },
  { body: 'temperature', is_correct: false, feedback: '惜しい！「熱」は <b>fever</b> です。"temperature" は「体温・温度」全般を指します。' }
])

step = situation.steps.create!(step_number: 2, body: '「熱があるようです」を英語で言うと？')
step.choices.create!([
  { body: 'I think I have a fever.', is_correct: true, feedback: '正解！「熱があるようです」は <b>I think I have a fever.</b> です。"I think" を冒頭に置くことで断定を避け、「〜のようです」という不確かさを自然に表現できます。' },
  { body: 'I feel hot.', is_correct: false, feedback: '惜しい！「熱があるようです」は <b>I think I have a fever.</b> です。"I feel hot" は「暑く感じる」という意味で、発熱の申告としては不十分です。' },
  { body: 'I have a high temperature.', is_correct: false, feedback: '惜しい！「熱があるようです」は <b>I think I have a fever.</b> です。' }
])

step = situation.steps.create!(step_number: 3, body: '「熱があるようです。」を英語で言うと？')
step.choices.create!([
  { body: 'I think I have a fever.', is_correct: true, feedback: '正解！<br>"I think" で不確かさを表しつつ、"have a fever" で発熱の状態を伝えます。医療機関や薬局でそのまま使える実用的な一言です。' },
  { body: 'I feel like I have a cold.', is_correct: false, feedback: '惜しい！正解は <b>I think I have a fever.</b> です。' },
  { body: 'My body feels warm.', is_correct: false, feedback: '惜しい！正解は <b>I think I have a fever.</b> です。' }
])

step = situation.steps.create!(step_number: 4, body: '今回のフレーズをもう一度確認しましょう。<br>「熱があるようです。」')
step.choices.create!([
  { body: 'I think I have a fever.', is_correct: true, feedback: '"I think" を冒頭に置くと「〜だと思います・〜のようです」という控えめなニュアンスになります。海外の医療現場では症状を正確に伝えることが大切です。' }
])

# === センテンス2: I feel nauseous and dizzy. ===

step = situation.steps.create!(step_number: 5, body: '「吐き気がする」を英語で言うと？')
step.choices.create!([
  { body: 'nauseous', is_correct: true, feedback: '正解！「吐き気がする」は <b>nauseous</b> です。形容詞で「むかむかする・吐き気を催している」状態を表します。"I feel nauseous." が定番の言い方です。' },
  { body: 'dizzy', is_correct: false, feedback: '惜しい！「吐き気がする」は <b>nauseous</b> です。"dizzy" は「めまいがする」という意味です。' },
  { body: 'sick', is_correct: false, feedback: '惜しい！「吐き気がする」は <b>nauseous</b> です。"sick" は広く「具合が悪い」を意味しますが、吐き気の具体的な表現としては "nauseous" が適切です。' }
])

step = situation.steps.create!(step_number: 6, body: '「吐き気とめまいがします」を英語で言うと？')
step.choices.create!([
  { body: 'I feel nauseous and dizzy.', is_correct: true, feedback: '正解！「吐き気とめまいがします」は <b>I feel nauseous and dizzy.</b> です。"I feel＋形容詞" で体の状態を伝える構文。複数の症状を "and" でつなぐことで一度に説明できます。' },
  { body: 'I have a stomachache and headache.', is_correct: false, feedback: '惜しい！「吐き気とめまいがします」は <b>I feel nauseous and dizzy.</b> です。' },
  { body: "I'm feeling sick and tired.", is_correct: false, feedback: '惜しい！「吐き気とめまいがします」は <b>I feel nauseous and dizzy.</b> です。' }
])

step = situation.steps.create!(step_number: 7, body: '「吐き気とめまいがします。」を英語で言うと？')
step.choices.create!([
  { body: 'I feel nauseous and dizzy.', is_correct: true, feedback: '正解！<br>"nauseous" は吐き気、"dizzy" はめまいを表す形容詞。"I feel＋形容詞" の構文で体調の症状をまとめて伝えることができます。' },
  { body: 'I have nausea and vertigo.', is_correct: false, feedback: '惜しい！正解は <b>I feel nauseous and dizzy.</b> です。' },
  { body: "My stomach hurts and I can't stand.", is_correct: false, feedback: '惜しい！正解は <b>I feel nauseous and dizzy.</b> です。' }
])

step = situation.steps.create!(step_number: 8, body: '今回のフレーズをもう一度確認しましょう。<br>「吐き気とめまいがします。」')
step.choices.create!([
  { body: 'I feel nauseous and dizzy.', is_correct: true, feedback: '"I feel＋形容詞" は体の状態を伝える基本構文です。"nauseous"（吐き気）・"dizzy"（めまい）・"weak"（だるい）など、症状を表す形容詞を入れ替えて使えます。' }
])

# === センテンス3: Is there a hospital nearby with an English-speaking doctor? ===

step = situation.steps.create!(step_number: 9, body: '「近くに」を英語で言うと？')
step.choices.create!([
  { body: 'nearby', is_correct: true, feedback: '正解！「近くに」は <b>nearby</b> です。副詞・形容詞として使えます。"Is there a pharmacy nearby?" のように文末に置くのが自然な使い方です。' },
  { body: 'close', is_correct: false, feedback: '惜しい！「近くに」は <b>nearby</b> です。"close" も「近い」という意味ですが、"nearby" の方が場所を探す文脈でよく使われます。' },
  { body: 'around', is_correct: false, feedback: '惜しい！「近くに」は <b>nearby</b> です。"around here" で「この辺に」という表現になります。' }
])

step = situation.steps.create!(step_number: 10, body: '「英語を話せる医者」を英語で言うと？')
step.choices.create!([
  { body: 'an English-speaking doctor', is_correct: true, feedback: '正解！「英語を話せる医者」は <b>an English-speaking doctor</b> です。"〜-speaking" は「〜語を話す」という意味の複合形容詞です。"Japanese-speaking staff" のように応用できます。' },
  { body: 'a doctor who speaks English', is_correct: false, feedback: '惜しい！「英語を話せる医者」は <b>an English-speaking doctor</b> です。意味は同じですが、より簡潔な表現を覚えましょう。' },
  { body: 'an English doctor', is_correct: false, feedback: '惜しい！「英語を話せる医者」は <b>an English-speaking doctor</b> です。"an English doctor" だと「イギリス人の医者」になってしまいます。' }
])

step = situation.steps.create!(step_number: 11, body: '「近くに英語を話せる医者がいる病院はありますか？」を英語で言うと？')
step.choices.create!([
  { body: 'Is there a hospital nearby with an English-speaking doctor?', is_correct: true, feedback: '正解！<br>"Is there 〜 nearby?" で「近くに〜はありますか？」という場所を尋ねる構文です。"with an English-speaking doctor" を後置することで条件を自然に追加できます。' },
  { body: 'Where is the nearest hospital with English service?', is_correct: false, feedback: '惜しい！正解は <b>Is there a hospital nearby with an English-speaking doctor?</b> です。' },
  { body: 'Can you find me a hospital where doctors speak English?', is_correct: false, feedback: '惜しい！正解は <b>Is there a hospital nearby with an English-speaking doctor?</b> です。' }
])

step = situation.steps.create!(step_number: 12, body: '今回のフレーズをもう一度確認しましょう。<br>「近くに英語を話せる医者がいる病院はありますか？」')
step.choices.create!([
  { body: 'Is there a hospital nearby with an English-speaking doctor?', is_correct: true, feedback: '"Is there 〜 nearby?" は「近くに〜はありますか？」の便利な構文。"hospital" を "pharmacy"（薬局）や "clinic"（クリニック）に変えるだけで様々な場面に応用できます。' }
])

# === センテンス4: I have travel insurance. ===

step = situation.steps.create!(step_number: 13, body: '「保険」を英語で言うと？')
step.choices.create!([
  { body: 'insurance', is_correct: true, feedback: '正解！「保険」は <b>insurance</b> です。"travel insurance"（旅行保険）・"health insurance"（健康保険）のように種類を前に置いて使います。' },
  { body: 'assurance', is_correct: false, feedback: '惜しい！「保険」は <b>insurance</b> です。"assurance" は主に生命保険や保証を指す英国英語表現です。' },
  { body: 'coverage', is_correct: false, feedback: '惜しい！「保険」は <b>insurance</b> です。"coverage" は「補償範囲・カバー範囲」という意味で、保険の話題でも使いますが単独では「保険」を指しません。' }
])

step = situation.steps.create!(step_number: 14, body: '「旅行保険に加入しています」を英語で言うと？')
step.choices.create!([
  { body: 'I have travel insurance.', is_correct: true, feedback: '正解！「旅行保険に加入しています」は <b>I have travel insurance.</b> です。"have" は所持だけでなく「〜に加入している」という状態も表します。シンプルで最も伝わりやすい表現です。' },
  { body: "I've got an insurance policy.", is_correct: false, feedback: '惜しい！「旅行保険に加入しています」は <b>I have travel insurance.</b> です。' },
  { body: "I'm covered by insurance.", is_correct: false, feedback: '惜しい！「旅行保険に加入しています」は <b>I have travel insurance.</b> です。' }
])

step = situation.steps.create!(step_number: 15, body: '「旅行保険に加入しています。」を英語で言うと？')
step.choices.create!([
  { body: 'I have travel insurance.', is_correct: true, feedback: '正解！<br>海外の医療機関では保険の有無を最初に確認されることが多いです。"I have travel insurance." と伝えるだけで、その後の手続きがスムーズになります。' },
  { body: 'I bought insurance before my trip.', is_correct: false, feedback: '惜しい！正解は <b>I have travel insurance.</b> です。' },
  { body: 'My insurance will cover the costs.', is_correct: false, feedback: '惜しい！正解は <b>I have travel insurance.</b> です。' }
])

step = situation.steps.create!(step_number: 16, body: '今回のフレーズをもう一度確認しましょう。<br>「旅行保険に加入しています。」')
step.choices.create!([
  { body: 'I have travel insurance.', is_correct: true, feedback: '保険証書を見せながら "Here is my insurance card."（これが保険証です）と一緒に使えると完璧です。"travel insurance" は海外では必須の備えです。' }
])

# === センテンス5: Please call an ambulance. ===

step = situation.steps.create!(step_number: 17, body: '「救急車」を英語で言うと？')
step.choices.create!([
  { body: 'ambulance', is_correct: true, feedback: '正解！「救急車」は <b>ambulance</b> です。緊急時に真っ先に使える単語のひとつ。発音は「アンビュランス」です。' },
  { body: 'emergency car', is_correct: false, feedback: '惜しい！「救急車」は <b>ambulance</b> です。"emergency car" という表現は英語では使いません。' },
  { body: 'rescue vehicle', is_correct: false, feedback: '惜しい！「救急車」は <b>ambulance</b> です。"rescue vehicle" は意味は通じますが、日常では使いません。' }
])

step = situation.steps.create!(step_number: 18, body: '「救急車を呼んでください」を英語で言うと？')
step.choices.create!([
  { body: 'Please call an ambulance.', is_correct: true, feedback: '正解！「救急車を呼んでください」は <b>Please call an ambulance.</b> です。"Please call 〜" は「〜を呼んでください」という丁寧な依頼表現。緊急時にはより短く "Call an ambulance!" とも言えます。' },
  { body: 'I need emergency help.', is_correct: false, feedback: '惜しい！「救急車を呼んでください」は <b>Please call an ambulance.</b> です。' },
  { body: 'Get me to a hospital!', is_correct: false, feedback: '惜しい！「救急車を呼んでください」は <b>Please call an ambulance.</b> です。' }
])

step = situation.steps.create!(step_number: 19, body: '「救急車を呼んでください。」を英語で言うと？')
step.choices.create!([
  { body: 'Please call an ambulance.', is_correct: true, feedback: '正解！<br>緊急時は "Call an ambulance!" と "Please" を省いても問題ありません。状況の深刻さに応じて使い分けましょう。海外の緊急番号（米国は911、英国は999）も覚えておくと安心です。' },
  { body: 'Please send emergency services.', is_correct: false, feedback: '惜しい！正解は <b>Please call an ambulance.</b> です。' },
  { body: 'I need you to call for help.', is_correct: false, feedback: '惜しい！正解は <b>Please call an ambulance.</b> です。' }
])

step = situation.steps.create!(step_number: 20, body: '今回のフレーズをもう一度確認しましょう。<br>「救急車を呼んでください。」')
step.choices.create!([
  { body: 'Please call an ambulance.', is_correct: true, feedback: '"Please call 〜" は緊急時の依頼に使える構文です。"Please call a doctor."（医者を呼んでください）・"Please call the front desk."（フロントを呼んでください）のように応用できます。' }
])

# ============================================================
# Situation 2: 空港で預け荷物を無くした時に使える英会話
# ============================================================

situation = Situation.create!(
  title: "空港で預け荷物を無くした時に使える英会話",
  overview: "空港で荷物が行方不明になったときに使える英会話を学びます。",
  scenario: "フライト後にバゲージクレームで待っていても荷物が出てきません。航空会社のスタッフに状況を説明し、荷物の特徴を伝えて捜索を依頼する必要があります。",
  thumbnail: "top/situation_thum_luggage.png"
)

# === センテンス1: My luggage hasn't arrived. ===

step = situation.steps.create!(step_number: 1, body: '「荷物・手荷物」を英語で言うと？')
step.choices.create!([
  { body: 'luggage', is_correct: true, feedback: '正解！「荷物・手荷物」は <b>luggage</b> です。"baggage" もほぼ同じ意味で使えます。空港では "checked luggage"（預け荷物）・"carry-on luggage"（機内持ち込み荷物）と区別します。' },
  { body: 'baggage', is_correct: false, feedback: '惜しい！「荷物・手荷物」は <b>luggage</b> です。"baggage" も正しい表現ですが、今回は "luggage" を覚えましょう。' },
  { body: 'suitcase', is_correct: false, feedback: '惜しい！「荷物・手荷物」は <b>luggage</b> です。"suitcase" はスーツケース本体を指す言葉で、荷物全般を指す "luggage" とは異なります。' }
])

step = situation.steps.create!(step_number: 2, body: '「荷物が届いていません」を英語で言うと？')
step.choices.create!([
  { body: "My luggage hasn't arrived.", is_correct: true, feedback: '正解！「荷物が届いていません」は <b>My luggage hasn\'t arrived.</b> です。現在完了の否定形で「（今の時点でまだ）届いていない」という状況を表します。空港スタッフへの第一声として最も自然な表現です。' },
  { body: "I can't find my bag.", is_correct: false, feedback: '惜しい！「荷物が届いていません」は <b>My luggage hasn\'t arrived.</b> です。' },
  { body: 'My suitcase is missing.', is_correct: false, feedback: '惜しい！「荷物が届いていません」は <b>My luggage hasn\'t arrived.</b> です。' }
])

step = situation.steps.create!(step_number: 3, body: '「荷物が届いていません。」を英語で言うと？')
step.choices.create!([
  { body: "My luggage hasn't arrived.", is_correct: true, feedback: '正解！<br>現在完了の否定形 "hasn\'t arrived" は「（今まだ）届いていない」という継続的な未着を表します。バゲージクレームでスタッフに声をかける際の定番フレーズです。' },
  { body: "My luggage didn't come out.", is_correct: false, feedback: "惜しい！正解は <b>My luggage hasn't arrived.</b> です。" },
  { body: "I lost my luggage.", is_correct: false, feedback: "惜しい！正解は <b>My luggage hasn't arrived.</b> です。" }
])

step = situation.steps.create!(step_number: 4, body: '今回のフレーズをもう一度確認しましょう。<br>「荷物が届いていません。」')
step.choices.create!([
  { body: "My luggage hasn't arrived.", is_correct: true, feedback: '"hasn\'t arrived" は現在完了の否定形。「まだ届いていない」という状態を伝えます。"I lost my luggage." は「自分でなくした」というニュアンスになるので、航空会社の責任を伝えるには "hasn\'t arrived" が適切です。' }
])

# === センテンス2: Here is my baggage claim tag. ===

step = situation.steps.create!(step_number: 5, body: '「荷物引換証」を英語で言うと？')
step.choices.create!([
  { body: 'baggage claim tag', is_correct: true, feedback: '正解！「荷物引換証」は <b>baggage claim tag</b> です。チェックイン時に荷物に付けられ、半券が搭乗券に貼られる番号付きのタグのことです。' },
  { body: 'boarding pass', is_correct: false, feedback: '惜しい！「荷物引換証」は <b>baggage claim tag</b> です。"boarding pass" は搭乗券のことです。' },
  { body: 'luggage receipt', is_correct: false, feedback: '惜しい！「荷物引換証」は <b>baggage claim tag</b> です。' }
])

step = situation.steps.create!(step_number: 6, body: '「これが荷物引換証です」を英語で言うと？')
step.choices.create!([
  { body: 'Here is my baggage claim tag.', is_correct: true, feedback: '正解！「これが荷物引換証です」は <b>Here is my baggage claim tag.</b> です。"Here is 〜" は物を差し出しながら「これが〜です」と示す表現です。書類やカードを提示する場面で広く使えます。' },
  { body: 'This is my tag for the baggage.', is_correct: false, feedback: '惜しい！「これが荷物引換証です」は <b>Here is my baggage claim tag.</b> です。' },
  { body: 'I have a claim tag here.', is_correct: false, feedback: '惜しい！「これが荷物引換証です」は <b>Here is my baggage claim tag.</b> です。' }
])

step = situation.steps.create!(step_number: 7, body: '「これが荷物引換証です。」を英語で言うと？')
step.choices.create!([
  { body: 'Here is my baggage claim tag.', is_correct: true, feedback: '正解！<br>"Here is 〜" は物を手渡したり提示したりする際の自然な表現です。"Here is my passport."（パスポートです）のように、様々な書類の提示場面で使えます。' },
  { body: 'This is the tag from my luggage.', is_correct: false, feedback: '惜しい！正解は <b>Here is my baggage claim tag.</b> です。' },
  { body: 'I want to show you my claim tag.', is_correct: false, feedback: '惜しい！正解は <b>Here is my baggage claim tag.</b> です。' }
])

step = situation.steps.create!(step_number: 8, body: '今回のフレーズをもう一度確認しましょう。<br>「これが荷物引換証です。」')
step.choices.create!([
  { body: 'Here is my baggage claim tag.', is_correct: true, feedback: '"Here is 〜" は物を提示する場面の定番表現。"Here is my ID."・"Here is my reservation number." のように応用できます。荷物紛失の申告時は必ずこのタグが必要になります。' }
])

# === センテンス3: My bag is a large black suitcase with a red ribbon. ===

step = situation.steps.create!(step_number: 9, body: '「スーツケース」を英語で言うと？')
step.choices.create!([
  { body: 'suitcase', is_correct: true, feedback: '正解！「スーツケース」は <b>suitcase</b> です。旅行用の硬い箱型の荷物を指します。"bag" より具体的に形状を伝えられます。' },
  { body: 'trunk', is_correct: false, feedback: '惜しい！「スーツケース」は <b>suitcase</b> です。"trunk" は大型の木箱や車のトランクを指します。' },
  { body: 'backpack', is_correct: false, feedback: '惜しい！「スーツケース」は <b>suitcase</b> です。"backpack" はリュックサックのことです。' }
])

step = situation.steps.create!(step_number: 10, body: '「赤いリボンのついた大きな黒いスーツケース」を英語で言うと？')
step.choices.create!([
  { body: 'a large black suitcase with a red ribbon', is_correct: true, feedback: '正解！「赤いリボンのついた大きな黒いスーツケース」は <b>a large black suitcase with a red ribbon</b> です。英語の形容詞の語順は「大きさ→色→名詞」が基本。目印を "with 〜" で後置します。' },
  { body: 'a black large suitcase with red ribbon', is_correct: false, feedback: '惜しい！「赤いリボンのついた大きな黒いスーツケース」は <b>a large black suitcase with a red ribbon</b> です。形容詞の語順は「大きさ（large）→色（black）」の順が正しいです。' },
  { body: 'a big dark suitcase tied with red', is_correct: false, feedback: '惜しい！「赤いリボンのついた大きな黒いスーツケース」は <b>a large black suitcase with a red ribbon</b> です。' }
])

step = situation.steps.create!(step_number: 11, body: '「私のバッグは赤いリボンのついた大きな黒いスーツケースです。」を英語で言うと？')
step.choices.create!([
  { body: 'My bag is a large black suitcase with a red ribbon.', is_correct: true, feedback: '正解！<br>荷物の特徴を正確に伝えるほど早く見つけてもらえます。サイズ・色・目印の順で説明するのが伝わりやすいコツです。' },
  { body: 'I have a black big bag with red marks.', is_correct: false, feedback: '惜しい！正解は <b>My bag is a large black suitcase with a red ribbon.</b> です。' },
  { body: 'My suitcase is black and large with something red.', is_correct: false, feedback: '惜しい！正解は <b>My bag is a large black suitcase with a red ribbon.</b> です。' }
])

step = situation.steps.create!(step_number: 12, body: '今回のフレーズをもう一度確認しましょう。<br>「私のバッグは赤いリボンのついた大きな黒いスーツケースです。」')
step.choices.create!([
  { body: 'My bag is a large black suitcase with a red ribbon.', is_correct: true, feedback: '英語の形容詞の順番は「大きさ → 色 → 名詞」が基本です。目印は "with 〜" で後ろに追加します。旅行前にスーツケースの特徴を英語で言えるよう練習しておくと安心です。' }
])

# === センテンス4: How long will it take to locate my bag? ===

step = situation.steps.create!(step_number: 13, body: '「見つける・突き止める」を英語で言うと？')
step.choices.create!([
  { body: 'locate', is_correct: true, feedback: '正解！「見つける・突き止める」は <b>locate</b> です。単に "find" より「場所を特定して見つける」というニュアンスがあり、追跡・調査の文脈でよく使われます。' },
  { body: 'find', is_correct: false, feedback: '惜しい！「見つける・突き止める」は <b>locate</b> です。"find" も使えますが、"locate" は「所在を突き止める」という意味でより正確に状況を伝えられます。' },
  { body: 'search', is_correct: false, feedback: '惜しい！「見つける・突き止める」は <b>locate</b> です。"search" は「探す」という動作で、見つかるかどうかは含みません。' }
])

step = situation.steps.create!(step_number: 14, body: '「荷物を見つけるのにどのくらいかかりますか？」を英語で言うと？')
step.choices.create!([
  { body: 'How long will it take to locate my bag?', is_correct: true, feedback: '正解！「荷物を見つけるのにどのくらいかかりますか？」は <b>How long will it take to locate my bag?</b> です。"How long will it take to 〜?" は「〜するのにどのくらいかかりますか？」という所要時間を尋ねる定番構文です。' },
  { body: 'When will my bag be found?', is_correct: false, feedback: '惜しい！「荷物を見つけるのにどのくらいかかりますか？」は <b>How long will it take to locate my bag?</b> です。' },
  { body: 'How much time do you need to find it?', is_correct: false, feedback: '惜しい！「荷物を見つけるのにどのくらいかかりますか？」は <b>How long will it take to locate my bag?</b> です。' }
])

step = situation.steps.create!(step_number: 15, body: '「荷物を見つけるのにどのくらいかかりますか？」を英語で言うと？')
step.choices.create!([
  { body: 'How long will it take to locate my bag?', is_correct: true, feedback: '正解！<br>"How long will it take to 〜?" は所要時間を尋ねる万能構文です。"locate" を使うことで「追跡して所在を確認する」というプロセスへの期待が伝わります。' },
  { body: 'How soon can you find my luggage?', is_correct: false, feedback: '惜しい！正解は <b>How long will it take to locate my bag?</b> です。' },
  { body: 'Do you know where my bag is?', is_correct: false, feedback: '惜しい！正解は <b>How long will it take to locate my bag?</b> です。' }
])

step = situation.steps.create!(step_number: 16, body: '今回のフレーズをもう一度確認しましょう。<br>「荷物を見つけるのにどのくらいかかりますか？」')
step.choices.create!([
  { body: 'How long will it take to locate my bag?', is_correct: true, feedback: '"How long will it take to 〜?" は旅行中に何度でも使える便利な構文です。"How long will it take to get to the city center?"（市内中心部までどのくらいかかりますか？）のように応用できます。' }
])

# === センテンス5: Please contact me at this hotel when you find it. ===

step = situation.steps.create!(step_number: 17, body: '「連絡する」を英語で言うと？')
step.choices.create!([
  { body: 'contact', is_correct: true, feedback: '正解！「連絡する」は <b>contact</b> です。電話・メール・その他あらゆる手段での連絡を包括する便利な動詞です。"Please contact me." で「ご連絡ください」という丁寧な依頼になります。' },
  { body: 'call', is_correct: false, feedback: '惜しい！「連絡する」は <b>contact</b> です。"call" は電話に限定されますが、"contact" はより広い連絡手段を含みます。' },
  { body: 'reach', is_correct: false, feedback: '惜しい！「連絡する」は <b>contact</b> です。"reach" も「連絡が取れる」という意味で使えますが、"contact" の方が一般的です。' }
])

step = situation.steps.create!(step_number: 18, body: '「見つかったらこのホテルに連絡してください」を英語で言うと？')
step.choices.create!([
  { body: 'Please contact me at this hotel when you find it.', is_correct: true, feedback: '正解！「見つかったらこのホテルに連絡してください」は <b>Please contact me at this hotel when you find it.</b> です。"when you find it" で「見つかったとき」という条件を自然に伝えます。' },
  { body: 'Call me at the hotel if you find it.', is_correct: false, feedback: '惜しい！「見つかったらこのホテルに連絡してください」は <b>Please contact me at this hotel when you find it.</b> です。' },
  { body: 'Let me know when my bag shows up.', is_correct: false, feedback: '惜しい！「見つかったらこのホテルに連絡してください」は <b>Please contact me at this hotel when you find it.</b> です。' }
])

step = situation.steps.create!(step_number: 19, body: '「見つかったらこのホテルに連絡してください。」を英語で言うと？')
step.choices.create!([
  { body: 'Please contact me at this hotel when you find it.', is_correct: true, feedback: '正解！<br>"Please contact me at 〜" は「〜に連絡してください」という丁寧な依頼表現。"when you find it" を "if you find it" にすると「もし見つかったら」というより不確かなニュアンスになります。' },
  { body: 'Please notify me when the bag is found.', is_correct: false, feedback: '惜しい！正解は <b>Please contact me at this hotel when you find it.</b> です。' },
  { body: 'Send my bag to this hotel when it arrives.', is_correct: false, feedback: '惜しい！正解は <b>Please contact me at this hotel when you find it.</b> です。' }
])

step = situation.steps.create!(step_number: 20, body: '今回のフレーズをもう一度確認しましょう。<br>「見つかったらこのホテルに連絡してください。」')
step.choices.create!([
  { body: 'Please contact me at this hotel when you find it.', is_correct: true, feedback: '"contact me at 〜" の "at" は「〜という場所で」という意味。ホテル名や電話番号と一緒に伝えると確実です。荷物紛失の申告書（Property Irregularity Report）を受け取ることも忘れずに。' }
])

# ============================================================
# Situation 3: 海外で日本のことを聞かれた時に使える英会話
# ============================================================

situation = Situation.create!(
  title: "海外で日本のことを聞かれた時に使える英会話",
  overview: "海外で日本の文化や習慣について聞かれたときに使える英会話を学びます。",
  scenario: "海外旅行中に現地の人と話す機会があり、日本の四季・食文化・習慣・観光地などについて質問されました。英語で日本のことを紹介してみましょう。",
  thumbnail: "top/situation_thum_japan.png"
)

# === センテンス1: Japan has four distinct seasons. ===

step = situation.steps.create!(step_number: 1, body: '「はっきりした・뚜렷한」を英語で言うと？')
step.choices.create!([
  { body: 'distinct', is_correct: true, feedback: '正解！「はっきりした・뚜렷한」は <b>distinct</b> です。「他とはっきり区別できる・明確な」という意味です。"four distinct seasons" で「はっきりと分かれた四季」というニュアンスになります。' },
  { body: 'different', is_correct: false, feedback: '惜しい！「はっきりした・明確な」は <b>distinct</b> です。"different" は「異なる」という意味で、「はっきり区別できる」という強調のニュアンスは "distinct" の方が強いです。' },
  { body: 'clear', is_correct: false, feedback: '惜しい！「はっきりした・明確な」は <b>distinct</b> です。"clear" は「明確な・透明な」という意味で文脈が少し異なります。' }
])

step = situation.steps.create!(step_number: 2, body: '「日本には四季があります」を英語で言うと？')
step.choices.create!([
  { body: 'Japan has four distinct seasons.', is_correct: true, feedback: '正解！「日本には四季があります」は <b>Japan has four distinct seasons.</b> です。"distinct" を加えることで「はっきりと分かれた四季」という日本の気候の特徴を強調できます。' },
  { body: 'Japan has four different seasons.', is_correct: false, feedback: '惜しい！「日本には四季があります」は <b>Japan has four distinct seasons.</b> です。"different" より "distinct" の方が「明確に区別できる」という意味が強く出ます。' },
  { body: 'In Japan, we have four seasons.', is_correct: false, feedback: '惜しい！「日本には四季があります」は <b>Japan has four distinct seasons.</b> です。' }
])

step = situation.steps.create!(step_number: 3, body: '「日本には四季があります。」を英語で言うと？')
step.choices.create!([
  { body: 'Japan has four distinct seasons.', is_correct: true, feedback: '正解！<br>日本の四季は海外でも知られていますが、"distinct" を使って「はっきり分かれている」と説明すると、より具体的に伝わります。春の花見・夏の花火・秋の紅葉・冬の雪など例を加えると会話が広がります。' },
  { body: 'Japan experiences four seasons every year.', is_correct: false, feedback: '惜しい！正解は <b>Japan has four distinct seasons.</b> です。' },
  { body: 'There are four seasons in Japan like other countries.', is_correct: false, feedback: '惜しい！正解は <b>Japan has four distinct seasons.</b> です。' }
])

step = situation.steps.create!(step_number: 4, body: '今回のフレーズをもう一度確認しましょう。<br>「日本には四季があります。」')
step.choices.create!([
  { body: 'Japan has four distinct seasons.', is_correct: true, feedback: '"distinct" は「他とはっきり区別できる」という意味の形容詞。日本の四季について話す際は、各季節の特徴（spring cherry blossoms / summer humidity / autumn foliage / winter snow）も英語で言えると会話が弾みます。' }
])

# === センテンス2: Sushi is raw fish on seasoned rice. ===

step = situation.steps.create!(step_number: 5, body: '「生の」を英語で言うと？')
step.choices.create!([
  { body: 'raw', is_correct: true, feedback: '正解！「生の」は <b>raw</b> です。加熱・加工されていない状態を指します。"raw fish"（生魚）・"raw vegetables"（生野菜）のように使います。' },
  { body: 'fresh', is_correct: false, feedback: '惜しい！「生の」は <b>raw</b> です。"fresh" は「新鮮な」という意味で、加熱されているかどうかとは関係ありません。' },
  { body: 'uncooked', is_correct: false, feedback: '惜しい！「生の」は <b>raw</b> です。"uncooked" も「火を通していない」という意味で使えますが、"raw" の方が一般的です。' }
])

step = situation.steps.create!(step_number: 6, body: '「寿司は酢飯の上に生魚をのせた料理です」を英語で言うと？')
step.choices.create!([
  { body: 'Sushi is raw fish on seasoned rice.', is_correct: true, feedback: '正解！「寿司は酢飯の上に生魚をのせた料理です」は <b>Sushi is raw fish on seasoned rice.</b> です。"seasoned rice" は「味付けされた米」＝酢飯のこと。シンプルに本質を伝える説明です。' },
  { body: 'Sushi is fish with vinegar rice.', is_correct: false, feedback: '惜しい！「寿司は酢飯の上に生魚をのせた料理です」は <b>Sushi is raw fish on seasoned rice.</b> です。' },
  { body: 'Sushi means Japanese seafood dish.', is_correct: false, feedback: '惜しい！「寿司は酢飯の上に生魚をのせた料理です」は <b>Sushi is raw fish on seasoned rice.</b> です。' }
])

step = situation.steps.create!(step_number: 7, body: '「寿司は酢飯の上に生魚をのせた料理です。」を英語で言うと？')
step.choices.create!([
  { body: 'Sushi is raw fish on seasoned rice.', is_correct: true, feedback: '正解！<br>"seasoned rice" は酢・砂糖・塩で味付けされた酢飯を指します。"raw fish" と聞いて驚く外国人もいますが、この説明がきっかけで寿司への興味を持ってもらえることも多いです。' },
  { body: 'Sushi is sliced fish placed on top of rice.', is_correct: false, feedback: '惜しい！正解は <b>Sushi is raw fish on seasoned rice.</b> です。' },
  { body: 'Sushi is a Japanese dish made with seafood and rice.', is_correct: false, feedback: '惜しい！正解は <b>Sushi is raw fish on seasoned rice.</b> です。' }
])

step = situation.steps.create!(step_number: 8, body: '今回のフレーズをもう一度確認しましょう。<br>「寿司は酢飯の上に生魚をのせた料理です。」')
step.choices.create!([
  { body: 'Sushi is raw fish on seasoned rice.', is_correct: true, feedback: '"A is B" の形でシンプルに説明する構文は、文化紹介に便利です。"Ramen is noodles in a rich broth."・"Tempura is deep-fried seafood and vegetables." のように応用できます。' }
])

# === センテンス3: Taking off your shoes indoors is a common custom in Japan. ===

step = situation.steps.create!(step_number: 9, body: '「習慣・慣習」を英語で言うと？')
step.choices.create!([
  { body: 'custom', is_correct: true, feedback: '正解！「習慣・慣習」は <b>custom</b> です。文化的・社会的に根付いた行動様式を指します。"It\'s a custom in Japan to 〜" で「日本では〜するのが習慣です」という説明ができます。' },
  { body: 'habit', is_correct: false, feedback: '惜しい！「習慣・慣習」は <b>custom</b> です。"habit" は個人の習慣を指すのに対し、"custom" は文化・集団全体の慣習を指します。' },
  { body: 'tradition', is_correct: false, feedback: '惜しい！「習慣・慣習」は <b>custom</b> です。"tradition" は世代を超えて受け継がれる伝統を指します。' }
])

step = situation.steps.create!(step_number: 10, body: '「室内で靴を脱ぐのは日本の習慣です」を英語で言うと？')
step.choices.create!([
  { body: 'Taking off your shoes indoors is a common custom in Japan.', is_correct: true, feedback: '正解！「室内で靴を脱ぐのは日本の習慣です」は <b>Taking off your shoes indoors is a common custom in Japan.</b> です。動名詞 "Taking off〜" を主語にすることで「〜すること」という行為を主語にできます。' },
  { body: 'In Japan, we always remove shoes inside.', is_correct: false, feedback: '惜しい！「室内で靴を脱ぐのは日本の習慣です」は <b>Taking off your shoes indoors is a common custom in Japan.</b> です。' },
  { body: 'Japanese people take off shoes when entering home.', is_correct: false, feedback: '惜しい！「室内で靴を脱ぐのは日本の習慣です」は <b>Taking off your shoes indoors is a common custom in Japan.</b> です。' }
])

step = situation.steps.create!(step_number: 11, body: '「室内で靴を脱ぐのは日本の一般的な習慣です。」を英語で言うと？')
step.choices.create!([
  { body: 'Taking off your shoes indoors is a common custom in Japan.', is_correct: true, feedback: '正解！<br>動名詞（〜ing形）を主語にする構文は、習慣や行為を説明するときに便利です。"common" を加えることで「特別なことではなく一般的な習慣」というニュアンスが伝わります。' },
  { body: 'It is normal to take shoes off in Japanese homes.', is_correct: false, feedback: '惜しい！正解は <b>Taking off your shoes indoors is a common custom in Japan.</b> です。' },
  { body: 'Shoes are not allowed inside Japanese houses.', is_correct: false, feedback: '惜しい！正解は <b>Taking off your shoes indoors is a common custom in Japan.</b> です。' }
])

step = situation.steps.create!(step_number: 12, body: '今回のフレーズをもう一度確認しましょう。<br>「室内で靴を脱ぐのは日本の一般的な習慣です。」')
step.choices.create!([
  { body: 'Taking off your shoes indoors is a common custom in Japan.', is_correct: true, feedback: '"Taking off 〜 is a custom in Japan." の構文を使えば、日本の様々な習慣を紹介できます。"Bowing is a common custom in Japan."（お辞儀は日本の一般的な習慣です）のように応用できます。' }
])

# === センテンス4: Mount Fuji is the highest mountain in Japan. ===

step = situation.steps.create!(step_number: 13, body: '「最も高い」を英語で言うと？')
step.choices.create!([
  { body: 'the highest', is_correct: true, feedback: '正解！「最も高い」は <b>the highest</b> です。"high" の最上級で、必ず定冠詞 "the" を伴います。高さには "high/highest" を使い、背の高さには "tall/tallest" を使います。' },
  { body: 'the tallest', is_correct: false, feedback: '惜しい！「最も高い（標高）」は <b>the highest</b> です。"tallest" は人や建物など細長いものの高さに使います。山の標高には "highest" が適切です。' },
  { body: 'the biggest', is_correct: false, feedback: '惜しい！「最も高い」は <b>the highest</b> です。"biggest" は「最も大きい」という意味です。' }
])

step = situation.steps.create!(step_number: 14, body: '「富士山は日本で最も高い山です」を英語で言うと？')
step.choices.create!([
  { body: 'Mount Fuji is the highest mountain in Japan.', is_correct: true, feedback: '正解！「富士山は日本で最も高い山です」は <b>Mount Fuji is the highest mountain in Japan.</b> です。山の名前の前には "Mount" または "Mt." をつけます。最上級は "the＋形容詞の最上級＋名詞" の語順です。' },
  { body: 'Fuji Mountain is the most high in Japan.', is_correct: false, feedback: '惜しい！「富士山は日本で最も高い山です」は <b>Mount Fuji is the highest mountain in Japan.</b> です。"most high" は不自然で "highest" が正しい最上級です。' },
  { body: 'Mt. Fuji has the highest altitude in Japan.', is_correct: false, feedback: '惜しい！「富士山は日本で最も高い山です」は <b>Mount Fuji is the highest mountain in Japan.</b> です。' }
])

step = situation.steps.create!(step_number: 15, body: '「富士山は日本で最も高い山です。」を英語で言うと？')
step.choices.create!([
  { body: 'Mount Fuji is the highest mountain in Japan.', is_correct: true, feedback: '正解！<br>富士山の標高は3,776メートル。"It stands at 3,776 meters."（標高3,776メートルです）と数字を添えると、より具体的に伝わります。海外では富士山への関心が非常に高く、会話のきっかけになります。' },
  { body: 'Japan\'s tallest peak is Mount Fuji.', is_correct: false, feedback: '惜しい！正解は <b>Mount Fuji is the highest mountain in Japan.</b> です。' },
  { body: 'Mount Fuji is a very famous high mountain.', is_correct: false, feedback: '惜しい！正解は <b>Mount Fuji is the highest mountain in Japan.</b> です。' }
])

step = situation.steps.create!(step_number: 16, body: '今回のフレーズをもう一度確認しましょう。<br>「富士山は日本で最も高い山です。」')
step.choices.create!([
  { body: 'Mount Fuji is the highest mountain in Japan.', is_correct: true, feedback: '"the highest 〜 in Japan" の構文は「日本で最も〜な…」と紹介するときに使えます。"Tokyo is the largest city in Japan."（東京は日本最大の都市です）のように応用できます。' }
])

# === センテンス5: Japan is known for its punctual public transportation. ===

step = situation.steps.create!(step_number: 17, body: '「時間に正確な」を英語で言うと？')
step.choices.create!([
  { body: 'punctual', is_correct: true, feedback: '正解！「時間に正確な」は <b>punctual</b> です。約束の時間・スケジュールをきちんと守ることを表します。日本の電車の定時運行は世界的に有名で、この単語と一緒によく紹介されます。' },
  { body: 'accurate', is_correct: false, feedback: '惜しい！「時間に正確な」は <b>punctual</b> です。"accurate" は「正確な・精密な」という意味で、数値や情報の正確さを指します。' },
  { body: 'precise', is_correct: false, feedback: '惜しい！「時間に正確な」は <b>punctual</b> です。"precise" は「細かく正確な」という意味で、測定や表現の精密さを指します。' }
])

step = situation.steps.create!(step_number: 18, body: '「日本は時間に正確な公共交通機関で知られています」を英語で言うと？')
step.choices.create!([
  { body: 'Japan is known for its punctual public transportation.', is_correct: true, feedback: '正解！「日本は時間に正確な公共交通機関で知られています」は <b>Japan is known for its punctual public transportation.</b> です。"be known for 〜" は「〜で知られている」という定番表現です。' },
  { body: 'Japan has very accurate trains and buses.', is_correct: false, feedback: '惜しい！「日本は時間に正確な公共交通機関で知られています」は <b>Japan is known for its punctual public transportation.</b> です。' },
  { body: 'Japanese trains are always on time.', is_correct: false, feedback: '惜しい！「日本は時間に正確な公共交通機関で知られています」は <b>Japan is known for its punctual public transportation.</b> です。' }
])

step = situation.steps.create!(step_number: 19, body: '「日本は時間に正確な公共交通機関で知られています。」を英語で言うと？')
step.choices.create!([
  { body: 'Japan is known for its punctual public transportation.', is_correct: true, feedback: '正解！<br>"be known for 〜" は「〜で有名・知られている」という表現。"its" は Japan を指す代名詞です。日本の鉄道は1分以内の遅延率が世界最高水準で、外国人にとって驚きのポイントです。' },
  { body: 'Japan is famous for trains that come on time.', is_correct: false, feedback: '惜しい！正解は <b>Japan is known for its punctual public transportation.</b> です。' },
  { body: 'Public transport in Japan is very reliable and fast.', is_correct: false, feedback: '惜しい！正解は <b>Japan is known for its punctual public transportation.</b> です。' }
])

step = situation.steps.create!(step_number: 20, body: '今回のフレーズをもう一度確認しましょう。<br>「日本は時間に正確な公共交通機関で知られています。」')
step.choices.create!([
  { body: 'Japan is known for its punctual public transportation.', is_correct: true, feedback: '"Japan is known for 〜" の構文で日本の特徴を紹介できます。"Japan is known for its cuisine."（日本は料理で知られています）・"Japan is known for its safety."（日本は安全で知られています）のように応用できます。' }
])

# ============================================================
# Situation 4: 滞在先のホテルでベッドバグを見つけた時に使える英会話
# ============================================================

situation = Situation.create!(
  title: "滞在先のホテルでベッドバグを見つけた時に使える英会話",
  overview: "ホテルでベッドバグ（南京虫）を発見したときに使える英会話を学びます。",
  scenario: "宿泊中のホテルでベッドバグを発見し、体に噛み跡もあります。フロントに状況を報告し、部屋の変更と持ち物の洗濯、宿泊費の返金交渉が必要です。",
  thumbnail: "top/situation_thum_bedbug.png"
)

# === センテンス1: I found bedbugs in my room. ===

step = situation.steps.create!(step_number: 1, body: '「ベッドバグ（南京虫）」を英語で言うと？')
step.choices.create!([
  { body: 'bedbug', is_correct: true, feedback: '正解！「ベッドバグ（南京虫）」は <b>bedbug</b> です。マットレスや寝具に潜む小さな吸血害虫で、海外のホテルでは注意が必要です。"bed bug" と2語で書くこともあります。' },
  { body: 'cockroach', is_correct: false, feedback: '惜しい！「ベッドバグ」は <b>bedbug</b> です。"cockroach" はゴキブリのことです。' },
  { body: 'flea', is_correct: false, feedback: '惜しい！「ベッドバグ」は <b>bedbug</b> です。"flea" はノミのことです。' }
])

step = situation.steps.create!(step_number: 2, body: '「部屋でベッドバグを見つけました」を英語で言うと？')
step.choices.create!([
  { body: 'I found bedbugs in my room.', is_correct: true, feedback: '正解！「部屋でベッドバグを見つけました」は <b>I found bedbugs in my room.</b> です。"found" は "find" の過去形。事実を簡潔に伝える最も直接的な表現です。' },
  { body: 'There are bugs on my bed.', is_correct: false, feedback: '惜しい！「部屋でベッドバグを見つけました」は <b>I found bedbugs in my room.</b> です。' },
  { body: 'My room has some insect problems.', is_correct: false, feedback: '惜しい！「部屋でベッドバグを見つけました」は <b>I found bedbugs in my room.</b> です。' }
])

step = situation.steps.create!(step_number: 3, body: '「部屋でベッドバグを見つけました。」を英語で言うと？')
step.choices.create!([
  { body: 'I found bedbugs in my room.', is_correct: true, feedback: '正解！<br>ベッドバグを見つけたらすぐにフロントに報告することが重要です。"I found bedbugs in my room." と明確に伝えることで、ホテル側も迅速に対応します。' },
  { body: 'I discovered insects inside my bed.', is_correct: false, feedback: '惜しい！正解は <b>I found bedbugs in my room.</b> です。' },
  { body: "There's something biting me in my room.", is_correct: false, feedback: '惜しい！正解は <b>I found bedbugs in my room.</b> です。' }
])

step = situation.steps.create!(step_number: 4, body: '今回のフレーズをもう一度確認しましょう。<br>「部屋でベッドバグを見つけました。」')
step.choices.create!([
  { body: 'I found bedbugs in my room.', is_correct: true, feedback: 'ベッドバグは世界中のホテルで問題になっています。発見したら写真を撮り、"I found bedbugs in my room." とフロントに報告しましょう。対応が遅い場合は毅然と交渉することが大切です。' }
])

# === センテンス2: I have bite marks on my body. ===

step = situation.steps.create!(step_number: 5, body: '「噛み跡・虫刺され跡」を英語で言うと？')
step.choices.create!([
  { body: 'bite marks', is_correct: true, feedback: '正解！「噛み跡・虫刺され跡」は <b>bite marks</b> です。"bite" は「噛む・刺す」という動詞で、その痕跡が "bite marks" です。ベッドバグ被害の証拠として重要な言葉です。' },
  { body: 'scratch marks', is_correct: false, feedback: '惜しい！「噛み跡」は <b>bite marks</b> です。"scratch marks" は「引っかき傷」のことです。' },
  { body: 'rash', is_correct: false, feedback: '惜しい！「噛み跡」は <b>bite marks</b> です。"rash" は「発疹」のことで、虫刺され後にできることもありますが、噛み跡そのものではありません。' }
])

step = situation.steps.create!(step_number: 6, body: '「体に噛み跡があります」を英語で言うと？')
step.choices.create!([
  { body: 'I have bite marks on my body.', is_correct: true, feedback: '正解！「体に噛み跡があります」は <b>I have bite marks on my body.</b> です。"I have 〜 on my body" で体に何かがある状態を説明できます。被害の証拠として積極的に伝えましょう。' },
  { body: 'My body is covered in insect bites.', is_correct: false, feedback: '惜しい！「体に噛み跡があります」は <b>I have bite marks on my body.</b> です。' },
  { body: "I've been bitten all over.", is_correct: false, feedback: '惜しい！「体に噛み跡があります」は <b>I have bite marks on my body.</b> です。' }
])

step = situation.steps.create!(step_number: 7, body: '「体に噛み跡があります。」を英語で言うと？')
step.choices.create!([
  { body: 'I have bite marks on my body.', is_correct: true, feedback: '正解！<br>"bite marks" という具体的な言葉を使うことで、ベッドバグ被害であることをホテル側に明確に伝えられます。写真と合わせて証拠として提示しましょう。' },
  { body: 'Something bit me while I was sleeping.', is_correct: false, feedback: '惜しい！正解は <b>I have bite marks on my body.</b> です。' },
  { body: 'My skin has red spots from bugs.', is_correct: false, feedback: '惜しい！正解は <b>I have bite marks on my body.</b> です。' }
])

step = situation.steps.create!(step_number: 8, body: '今回のフレーズをもう一度確認しましょう。<br>「体に噛み跡があります。」')
step.choices.create!([
  { body: 'I have bite marks on my body.', is_correct: true, feedback: '"I have 〜 on my body." は体の状態を説明する便利な構文。より具体的に伝えたい場合は "on my arms and legs"（腕と足に）のように場所を追加できます。' }
])

# === センテンス3: I need to be moved to a different room immediately. ===

step = situation.steps.create!(step_number: 9, body: '「すぐに・即刻」を英語で言うと？')
step.choices.create!([
  { body: 'immediately', is_correct: true, feedback: '正解！「すぐに・即刻」は <b>immediately</b> です。"now" より強く、「一刻の猶予もなく」という緊迫感があります。クレームや緊急の依頼の際に文末に置くと要求の強さが増します。' },
  { body: 'quickly', is_correct: false, feedback: '惜しい！「すぐに・即刻」は <b>immediately</b> です。"quickly" は「素早く」という速さを表しますが、"immediately" は「即刻・この瞬間に」という即時性がより強い表現です。' },
  { body: 'urgently', is_correct: false, feedback: '惜しい！「すぐに・即刻」は <b>immediately</b> です。"urgently" は「緊急に」という意味で近いですが、行動の即時性を表すには "immediately" が適切です。' }
])

step = situation.steps.create!(step_number: 10, body: '「すぐに別の部屋に移してください」を英語で言うと？')
step.choices.create!([
  { body: 'I need to be moved to a different room immediately.', is_correct: true, feedback: '正解！「すぐに別の部屋に移してください」は <b>I need to be moved to a different room immediately.</b> です。"I need to be 〜" は「〜される必要がある・〜してもらう必要がある」という受動態の要求表現です。' },
  { body: 'Please give me another room right now.', is_correct: false, feedback: '惜しい！「すぐに別の部屋に移してください」は <b>I need to be moved to a different room immediately.</b> です。' },
  { body: 'I want to change my room immediately.', is_correct: false, feedback: '惜しい！「すぐに別の部屋に移してください」は <b>I need to be moved to a different room immediately.</b> です。' }
])

step = situation.steps.create!(step_number: 11, body: '「すぐに別の部屋に移してください。」を英語で言うと？')
step.choices.create!([
  { body: 'I need to be moved to a different room immediately.', is_correct: true, feedback: '正解！<br>"I need to be moved" という受動態は「（自分ではなくホテル側に）移してもらう必要がある」という意味で、責任の所在を明確にした要求表現です。"immediately" で緊急性を加えましょう。' },
  { body: 'Move me to another room as soon as possible.', is_correct: false, feedback: '惜しい！正解は <b>I need to be moved to a different room immediately.</b> です。' },
  { body: 'Can I get a room change right away?', is_correct: false, feedback: '惜しい！正解は <b>I need to be moved to a different room immediately.</b> です。' }
])

step = situation.steps.create!(step_number: 12, body: '今回のフレーズをもう一度確認しましょう。<br>「すぐに別の部屋に移してください。」')
step.choices.create!([
  { body: 'I need to be moved to a different room immediately.', is_correct: true, feedback: '"I need to be 〜" は「〜してもらう必要がある」という要求表現。"want" より "need" を使うことで、希望ではなく必要性として伝わります。ベッドバグ被害は健康被害なので、毅然と要求することが大切です。' }
])

# === センテンス4: Please wash all my belongings. ===

step = situation.steps.create!(step_number: 13, body: '「持ち物・所持品」を英語で言うと？')
step.choices.create!([
  { body: 'belongings', is_correct: true, feedback: '正解！「持ち物・所持品」は <b>belongings</b> です。"personal belongings" で「個人の所持品」。常に複数形で使います。ベッドバグは荷物に潜り込むため、持ち物の扱いが重要です。' },
  { body: 'possessions', is_correct: false, feedback: '惜しい！「持ち物・所持品」は <b>belongings</b> です。"possessions" も同じ意味ですが、"belongings" の方が日常的によく使われます。' },
  { body: 'luggage', is_correct: false, feedback: '惜しい！「持ち物・所持品」は <b>belongings</b> です。"luggage" は旅行の荷物・スーツケース類を指します。' }
])

step = situation.steps.create!(step_number: 14, body: '「持ち物を全て洗ってください」を英語で言うと？')
step.choices.create!([
  { body: 'Please wash all my belongings.', is_correct: true, feedback: '正解！「持ち物を全て洗ってください」は <b>Please wash all my belongings.</b> です。ベッドバグは衣類や荷物に卵を産むため、洗濯・熱処理が感染拡大防止に重要です。' },
  { body: 'Clean everything I own.', is_correct: false, feedback: '惜しい！「持ち物を全て洗ってください」は <b>Please wash all my belongings.</b> です。' },
  { body: 'Please sanitize my luggage and clothes.', is_correct: false, feedback: '惜しい！「持ち物を全て洗ってください」は <b>Please wash all my belongings.</b> です。' }
])

step = situation.steps.create!(step_number: 15, body: '「持ち物を全て洗ってください。」を英語で言うと？')
step.choices.create!([
  { body: 'Please wash all my belongings.', is_correct: true, feedback: '正解！<br>ベッドバグは60℃以上の熱で死滅します。"Please wash all my belongings in hot water."（熱湯で洗ってください）と付け加えると、より具体的な対処を求めることができます。' },
  { body: 'I want all my things to be cleaned.', is_correct: false, feedback: '惜しい！正解は <b>Please wash all my belongings.</b> です。' },
  { body: 'Please take care of my personal items.', is_correct: false, feedback: '惜しい！正解は <b>Please wash all my belongings.</b> です。' }
])

step = situation.steps.create!(step_number: 16, body: '今回のフレーズをもう一度確認しましょう。<br>「持ち物を全て洗ってください。」')
step.choices.create!([
  { body: 'Please wash all my belongings.', is_correct: true, feedback: '"belongings" は持ち物全般を指す便利な単語。"Please handle my belongings carefully."（持ち物を丁寧に扱ってください）のように様々な場面で使えます。ベッドバグ対策として帰国後も荷物を熱処理することをお勧めします。' }
])

# === センテンス5: I would like a full refund for my stay. ===

step = situation.steps.create!(step_number: 17, body: '「全額返金」を英語で言うと？')
step.choices.create!([
  { body: 'full refund', is_correct: true, feedback: '正解！「全額返金」は <b>full refund</b> です。"refund" は「返金・払い戻し」という意味。"full" で「全額」を表します。クレーム時の重要ワードです。' },
  { body: 'full payment', is_correct: false, feedback: '惜しい！「全額返金」は <b>full refund</b> です。"full payment" は「全額支払い」という意味になります。' },
  { body: 'complete return', is_correct: false, feedback: '惜しい！「全額返金」は <b>full refund</b> です。"return" は「返品・返却」を指すことが多く、"refund"（返金）とは異なります。' }
])

step = situation.steps.create!(step_number: 18, body: '「宿泊費の全額返金を求めます」を英語で言うと？')
step.choices.create!([
  { body: 'I would like a full refund for my stay.', is_correct: true, feedback: '正解！「宿泊費の全額返金を求めます」は <b>I would like a full refund for my stay.</b> です。"I would like 〜" は "I want 〜" より丁寧でありながら、要求としての意思は明確に伝わります。' },
  { body: 'Give me all my money back.', is_correct: false, feedback: '惜しい！「宿泊費の全額返金を求めます」は <b>I would like a full refund for my stay.</b> です。意味は通じますが、やや攻撃的な印象を与えることがあります。' },
  { body: 'I want to get my payment returned.', is_correct: false, feedback: '惜しい！「宿泊費の全額返金を求めます」は <b>I would like a full refund for my stay.</b> です。' }
])

step = situation.steps.create!(step_number: 19, body: '「宿泊費の全額返金を求めます。」を英語で言うと？')
step.choices.create!([
  { body: 'I would like a full refund for my stay.', is_correct: true, feedback: '正解！<br>"I would like 〜" は丁寧な要求表現。ベッドバグのような衛生上の問題は正当なクレーム理由になります。証拠（写真・噛み跡）を示しながら冷静に交渉しましょう。' },
  { body: 'Please refund the total cost of my accommodation.', is_correct: false, feedback: '惜しい！正解は <b>I would like a full refund for my stay.</b> です。' },
  { body: "I demand my money back for tonight's stay.", is_correct: false, feedback: '惜しい！正解は <b>I would like a full refund for my stay.</b> です。' }
])

step = situation.steps.create!(step_number: 20, body: '今回のフレーズをもう一度確認しましょう。<br>「宿泊費の全額返金を求めます。」')
step.choices.create!([
  { body: 'I would like a full refund for my stay.', is_correct: true, feedback: '"I would like 〜" は丁寧に要求・希望を伝える構文。"full refund" が難しい場合は "partial refund"（一部返金）や "compensation"（補償）も交渉の選択肢です。クレジットカード会社や旅行保険に相談することも覚えておきましょう。' }
])

puts "Seed data created successfully!"
puts "Situations: #{Situation.count}"
puts "Steps: #{Step.count}"
puts "Choices: #{Choice.count}"
