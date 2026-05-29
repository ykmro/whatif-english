# 冪等性を保つため、実行前にデータをクリア
Choice.destroy_all
Step.destroy_all
Situation.destroy_all

# ============================================================
# Situation 1: 脱獄
# ============================================================

situation = Situation.create!(
  title: "脱獄する時に使える英会話",
  overview: "無実の罪で投獄された囚人の物語を通して、脱獄当日に役立つ英会話を学びます。",
  scenario: "主人公のフランクは大手物流倉庫で働く中年男。たまたま要人の殺人現場に居合わせたことがきっかけで、無実の罪で投獄されてしまう。自分を陥れた謎の組織へ復讐を誓った彼は、刑務所内で仲間にした囚人たちとともに脱獄計画を企て、ついに決行日を迎える。
",
  thumbnail: "top/situation_thum_prison.png"
)

# --- STEP 1 ---
step1 = situation.steps.create!(
  step_number: 1,
  body: '脱獄決行当日の朝食時間。フランクは隣に座る相棒に、今夜計画通り実行することを耳打ちします。周りに悟られないよう、さりげなく。<br>「準備しておけ、今夜決行だ。」<br>と言いたい時に適切なフレーズを選びましょう。'
)

step1.choices.create!([
  {
    body: 'Tonight is the night. Stay ready.',
    is_correct: true,
    feedback: '「準備しておけ、今夜決行だ。」<br>"Tonight is the night" は慣用句として一塊で機能しています。"Stay＋形容詞" で「〜の状態を維持しろ」という命令形です。簡潔で、脱獄決行の合図として適切です。'
  },
  {
    body: 'Stay with me tonight.',
    is_correct: false,
    feedback: '「今夜は俺のそばにいて。」<br>"Stay with ＋人" は「〜のそばを離れるな・一緒にいろ」というフレーズです。"tonight" は文末に置くのが自然ですが、"Tonight, stay with me." とすると「今夜は（他の夜と違って）」という対比のニュアンスが生まれ、少し違う響きになります。耳元で囁かれた相棒は少し動揺するかもしれません。'
  },
  {
    body: 'Stay gold, no matter what happens.',
    is_correct: false,
    feedback: '「何があっても、そのままの輝きを失うな。」<br>"Stay＋形容詞" で「その状態を保て」という命令。"gold" は直訳の「金」ではなく、純粋さ・若さ・かけがえのない価値の比喩です。"no matter what happens" は「どんなことが起きても」という譲歩表現で、文全体に強い決意と普遍性を与えています。なおこのフレーズは映画『アウトサイダーズ』で有名になり、原典はロバート・フロストの詩に由来するため、やや文学的で“キザ”に響く可能性もあります。耳元で囁かれた相棒の表情は思わず崩れてしまうかもしれません。'
  }
])

# --- STEP 2 ---
step2 = situation.steps.create!(
  step_number: 2,
  body: '夜の清掃時間。共有のシャワー室に集合した囚人たちは、室内の頑丈なダクトを静かに外し始める。看守が見廻に来る前に手早く済ませなければ。<br>「急ぐんだ。音を立てるな。」と言いたい時に適切なフレーズを選びましょう。'
)

step2.choices.create!([
  {
    body: 'Move fast. Not a sound.',
    is_correct: true,
    feedback: '「急ぐんだ。音を立てるな。」<br>"Move fast" は「速く動け」という動作への直接的な命令で、感情より指示に重きが置かれています。軍隊や緊急時の指揮官が使うような、冷静で即物的なニュアンスがあります。"Not a sound" は "Don\'t make a sound" を削ぎ落とした名詞句の命令表現です。'
  },
  {
    body: 'Hurry up, but be quiet.',
    is_correct: false,
    feedback: '「急いで。でも、静かに。」<br>意味は正しく伝わりますが、"hurry up" はややカジュアルな響きで、家族に「早くしなさい」と言う場面でも使えるくらい、日常に溶け込んでいます。命令よりは催促のニュアンスなので、この状況では少し頼りない響きです。'
  },
  {
    body: 'Slow is smooth, smooth is fast.',
    is_correct: false,
    feedback: '「ゆっくり正確にやることが、結果的に最速になる」<br>これは軍隊や特殊部隊で使われる格言（ミリタリースラング）です。slow / smooth / fast はすべて本来は「形容詞」ですが、この文では、そのまま「名詞的」に使われています。一刻を争うこの状況では逆に仲間をイラつかせてしまうかもしれません。'
  }
])

# --- STEP 3 ---
step3 = situation.steps.create!(
  step_number: 3,
  body: 'ダクトに潜り込み、痕跡も消せた。あとは唯一鉄格子のない窓がある医務室へ降りるだけだ。すると仲間の一人が顔に落ちてきたネズミに驚き、悲鳴をあげてしまった。<br>「落ち着け。一声でも出せば終わりだ。」と言いたい時に適切なフレーズを選びましょう。'
)

step3.choices.create!([
  {
    body: 'Stay calm. You\'re going to get us caught.',
    is_correct: false,
    feedback: '「落ち着け。お前のせいで捕まるぞ。」<br>"Stay calm" は感情の状態に対する指示で、「今パニックになっているその感情を抑えろ」というニュアンスです。医療現場や危機対応マニュアルでも使われます。一方 "You\'re going to get us caught" は「お前のせいで捕まる」という責任の所在を明示する表現です。ここでは仲間を責め立てる言葉より、まず黙らせる一言が先です。'
  },
  {
    body: 'Keep it together. One sound and we\'re dead.',
    is_correct: true,
    feedback: '「落ち着け。一声でも出せば終わりだ。」<br>"Keep it together" は「自分をまとめて保て」という内側への働きかけで、「お前自身がバラバラになるな」というニュアンスが含まれます。"One sound and we\'re dead" は "If you make one sound, we\'re dead" を圧縮した構文です。条件節を省くことで警告のテンポが上がり、切迫感が一気に増します。'
  },
  {
    body: 'Get busy living, or get busy dying.',
    is_correct: false,
    feedback: '「生きることに必死になれ、さもなくば死ぬことに必死になれ。」<br>映画『ショーシャンクの空に』でアンディが語る名台詞です。脱獄という文脈では刺さる一言ですが、この台詞が持つのは哲学的な覚悟であり、今まさにダクトの中でパニックになっている仲間を制御する言葉ではありません。名台詞は、タイミングが命です。'
  }
])

# --- STEP 4 ---
step4 = situation.steps.create!(
  step_number: 4,
  body: '看守に気づかれた。医務室へ向かっていることを勘付かれる前に急がなければ。仲間の何人かが怖気付いている。<br>「もう後には退けない。行け。」と言いたい時に適切なフレーズを選びましょう。'
)

step4.choices.create!([
  {
    body: 'We\'re past the point of no return. Move.',
    is_correct: true,
    feedback: '「もう後には退けない。行け。」<br>"The point of no return" は「引き返せない地点」を意味する慣用句です。"We\'re past〜" でその地点をすでに越えたと示し、最後の "Move." という一語の命令が全体を締めています。怖気付く仲間に退路がないことを論理的に示す、リーダーとして最も説得力のある言葉です。'
  },
  {
    body: 'Trust me, this is going to work. Keep moving.',
    is_correct: false,
    feedback: '「信じてくれ、きっとうまくいく。動き続けるんだ。」<br>"Keep moving" の指示自体は適切ですが、"Trust me, this is going to work" は根拠のない楽観であり、状況の深刻さを軽く見せてしまいます。怖気付いている仲間に必要なのは励ましより、覚悟を促す言葉でしょう。'
  },
  {
    body: 'I\'m going to make him an offer he can\'t refuse.',
    is_correct: false,
    feedback: '「断れない申し出をしてやる。」<br>映画『ゴッドファーザー』でコルレオーネが使う伝説的な台詞です。圧倒的な存在感と凄みを持つ一言ですが、今は看守に気づかれ逃走中であり、交渉の余地はありません。'
  }
])

# ============================================================
# Situation: ゾンビに襲われたら使える英会話
# ============================================================

situation = Situation.create!(
  title: "ゾンビに襲われたら使える英会話",
  overview: "ゾンビが蔓延る荒廃した世界で生き残るための英会話を学びます。",
  scenario: "国家同士の争いで使われた化学兵器によって死者がゾンビ化してしまった世界。生き残ったわずかな人々は身を寄せ合い、食糧を求めて街から街へと旅を続ける。",
  thumbnail: "top/situation_thum_zombie.png"
)

# --- STEP 1 ---
step1 = situation.steps.create!(
  step_number: 1,
  body: '新たな街へ辿り着いた一行。廃墟となった施設にゾンビが潜んでいないのを確認したのち、元軍人のピーターは相棒とともに周辺の探察へ出かけます。またもや変わり果てた街を目の当たりにした相棒は深いため息をついています。<br>「浮かない顔だな。どうした？」と言いたい時に適切なフレーズを選びましょう。'
)

step1.choices.create!([
  {
    body: 'You look down. What\'s wrong?',
    is_correct: true,
    feedback: '「浮かない顔だな。どうした？」<br>"look down" は「気分が落ち込んでいる・元気がない」を表す自然なイディオムです。"look sad" が感情を直接指摘するのに対し、"look down" は表情や雰囲気から読み取るニュアンスがあり、相手への気遣いが自然に滲みます。'
  },
  {
    body: 'You don\'t look happy. Is something the matter?',
    is_correct: false,
    feedback: '「幸せそうに見えないな。何かあったか？」<br>文法的には正しく意味も通じますが、"don\'t look happy" はやや平坦で子どもっぽい印象があります。"Is something the matter?" も丁寧すぎて、廃墟での会話としては少し場違いに響きます。'
  },
  {
    body: 'Why so serious?',
    is_correct: false,
    feedback: '映画『ダークナイト』でジョーカーが放つ伝説的な一言です。「なぜそんなに深刻なの？」「何マジになっちゃってんの？」と元々は相手を嘲るような文脈で使われる台詞ですが、ゾンビだらけの世界でこれを言えるメンタルは逆に頼もしい。'
  }
])

# --- STEP 2 ---
step2 = situation.steps.create!(
  step_number: 2,
  body: 'しばらく探索したものの、人影も食料も、敵の気配すら見当たらない。そろそろ戻ろうかと思い始めたその瞬間、拠点の施設から仲間の悲鳴が聞こえます。<br>「何かが起きたようだ。すぐ戻るぞ。」と言いたい時に適切なフレーズを選びましょう。'
)

step2.choices.create!([
  {
    body: 'Something\'s wrong. We\'re heading back now.',
    is_correct: true,
    feedback: '「何かが起きたようだ。すぐ戻るぞ。」<br>"Something\'s wrong" は状況の異変を直感的に示す定番表現です。"We\'re heading back" と進行形にすることで「今すぐ動く」という即時性が生まれます。"now" を末尾に添えることで、命令ではなく一緒に動く決断として自然に響きます。'
  },
  {
    body: 'It seems like something has happened. We should return.',
    is_correct: false,
    feedback: '「何かが起きたようだ。戻るべきだろう。」<br>意味は正確に伝わりますが、"It seems like" と "We should" はどちらも間接的で、緊急場面にしては悠長な印象を与えます。悲鳴が聞こえた直後の反応として、判断のテンポが遅く感じられます。'
  },
  {
    body: 'I have a bad feeling about this.',
    is_correct: false,
    feedback: '「何か嫌な予感がする。」<br>映画『スター・ウォーズ』シリーズでジェダイたちに幾度となく繰り返される名台詞です。日常会話でも同様に使われます。フォースを信じましょう。'
  }
])

# --- STEP 3 ---
step3 = situation.steps.create!(
  step_number: 3,
  body: '急いで拠点に戻ると、どこから湧いてきたのか四方をゾンビの大群に囲まれています。仲間たちからゾンビの気を逸らすため、ピーターは大声で呼びかけます。<br>「おい、うすのろ。こっちだ、かかってこい！」と言いたい時に適切なフレーズを選びましょう。'
)

step3.choices.create!([
  {
    body: 'Hey, over here, you deadheads! Come and get me!',
    is_correct: true,
    feedback: '「おい、うすのろ。こっちだ、かかってこい！」<br>"deadheads" はゾンビへの蔑称として文脈にはまった表現です。"Come and get me" は「やれるもんならやってみろ」という挑発の定番フレーズで、命がけの場面でも力強く響きます。注意を引きつける実用性と、捨て身の覚悟が一言に凝縮されています。'
  },
  {
    body: 'Excuse me, you slow creatures. I \'m your opponent.',
    is_correct: false,
    feedback: '「すみません、動きの遅い皆さん。私が相手をしましょう。」<br>文法的には完璧です。しかしゾンビに礼儀正しさは不要です。"I \'m your opponent" も武道の試合のような格式があり、少年漫画でよくあるフレーズです。'
  },
  {
    body: 'Are you not entertained?',
    is_correct: false,
    feedback: '「お前らまだ十分に楽しんでないだろ？」<br>映画『グラディエーター』でラッセル・クロウがローマのコロッセオで群衆を煽るために放った一言。バトル漫画でもありがちな「まだ足りねえだろ？もっと来いよ」感のあるフレーズです。ゾンビの答えはおそらく「Yes」です。'
  }
])

# --- STEP 4 ---
step4 = situation.steps.create!(
  step_number: 4,
  body: 'ピーターはアーミーナイフで自分の体を傷つけ、血の匂いにつられたゾンビの大群は一気にピーターに向かっていきます。<br>「今のうちに早く逃げろ！」と言いたい時に適切なフレーズを選びましょう。'
)

step4.choices.create!([
  {
    body: 'Go! Get out of here while you can!',
    is_correct: true,
    feedback: '「今のうちに早く逃げろ！」<br>"while you can" が「今のうちに・できる間に」という切迫感を完璧に表します。"Go!" で始めることで反射的・命令的な緊張感が一気に出ます。自己犠牲の重さが、この短い一言に凝縮されています。'
  },
  {
    body: 'Please run away now. This is your chance to escape.',
    is_correct: false,
    feedback: '「今すぐ逃げてください。これが脱出のチャンスです。」<br>意味は正確ですが、"Please" が入ると瀬戸際感がゼロになります。"This is your chance to escape" も解説口調で、大群に囲まれながら叫ぶ台詞としては間延びしすぎています。'
  },
  {
    body: 'Get to the chopper!!',
    is_correct: false,
    feedback: '「ヘリに乗れ！！」<br>映画『プレデター』でシュワルツェネッガーが脱出シーンで絶叫した台詞です。気持ちはまったく同じです。ただし、残念ながらヘリがありません。'
  }
])

# ============================================================
# Situation: 隕石が衝突しそうな時に使う英会話
# ============================================================

situation = Situation.create!(
  title: "隕石が衝突しそうな時に使う英会話",
  overview: "小惑星が地球へ衝突しそうなときに使える英会話を学びます。",
  scenario: "天文台に勤める研究員のリオは観測データの異常に気づき、巨大小惑星「RT-9」が72時間後に地球へ衝突することを確認する。国際宇宙機関が小惑星破壊ミッションを立ち上げるが搭乗員が足りない。リオは自ら志願し、片道切符かもしれない宇宙へ旅立つ。",
  thumbnail: "top/situation_thum_asteroid.png"
)

# --- STEP 1 ---
step1 = situation.steps.create!(
  step_number: 1,
  body: '深夜の天文台。研究員のリオは観測データに不自然な軌道を発見します。画面を食い入るように見つめ、計算を何度も確認した末、同僚に声をかけます。<br>「やばいことになった」と言いたい時に適切なフレーズを選びましょう。'
)

step1.choices.create!([
  {
    body: 'We \'ve got a serious problem.',
    is_correct: true,
    feedback: '「やばいことになった。」<br>"We\'ve got" は "We have got" の短縮で、「〜という状況に直面している」という現在の深刻さを示します。"serious" が感情的な「やばい」を冷静な言葉に変換していて、研究員らしい落ち着きと緊張感が同居しています。"I\'ve got" ではなく "We\'ve got" にすることで、自分だけの問題ではなく巻き込む意識が滲みます。'
  },
  {
    body: 'We have an issue.',
    is_correct: false,
    feedback: '「問題が発生しました。」<br>"issue" は "problem" より柔らかく、会議で「議題がある」「懸念点がある」程度のニュアンスで使われることが多い単語です。"We have an issue with the design." のように、日常的なトラブルや軽微な懸念を指す場面に向いています。'
  },
  {
    body: 'Houston, we have a problem.',
    is_correct: false,
    feedback: '「ヒューストン、問題が発生した。」<br>アポロ13号の実際の交信から生まれ、映画『アポロ13』で広く知られた一言です。人類史上最大の問題を前に、これ以上適切な言葉はないかもしれません。'
  }
])

# --- STEP 2 ---
step2 = situation.steps.create!(
  step_number: 2,
  body: '政府の緊急声明から数時間後、ニュースキャスターが生放送で世界へ向けて報道しています。パニックが広がる中、唯一の希望となるミッションの存在を伝えます。<br>「最後の手段が動き出しました！」と言いたい時に適切なフレーズを選びましょう。'
)

step2.choices.create!([
  {
    body: 'A last-resort mission has been launched.',
    is_correct: true,
    feedback: '「最後の手段となるミッションが始動しました。」<br>"last-resort" は「他の選択肢がすべて尽きた末の」という形容詞で、追い詰められた状況を端的に示します。"launched" は宇宙船の打ち上げと作戦の開始という二重の意味を持ち、この文脈で特に効いています。報道文体としての格式も保たれています。'
  },
  {
    body: 'A last-chance mission has been launched.',
    is_correct: false,
    feedback: '「最後のチャンスとなるミッションが始動しました。」<br>"last-resort" との違いは微妙ですが、"last-chance" は「チャンスがこれ一つ残っている」という希望寄りのニュアンスです。"last-resort" が「もう他に手がない」という追い詰められた状況を示すのに対し、"last-chance" はやや楽観的に聞こえます。報道の言葉としては深刻さが少し足りません。'
  },
  {
    body: 'If I’d have known this was gonna be the last time, I’d have thought of something better to say.',
    is_correct: false,
    feedback: 'これが最後だと知ってたら、もっと何か考えて話したのに。<br>映画『フォレスト・ガンプ』でトム・ハンクス演じるフォレストが、親友の死を回想するシーンで使われた台詞です。「If I \'d have known〜, I \'d have thought of〜」は後悔を表す仮定法過去完了の表現。隕石衝突する直前なら刺さるかもしれませんが、まだ少し早いです。'
  }
])

# --- STEP 3 ---
step3 = situation.steps.create!(
  step_number: 3,
  body: '国際宇宙機関の緊急会議。小惑星破壊ミッションの概要が説明されましたが、危険すぎるため搭乗員の志願者が集まりません。沈黙が続く中、リオが立ち上がります。<br>「やります。志願します。」と言いたい時に適切なフレーズを選びましょう。'
)

step3.choices.create!([
  {
    body: "I'll do it. I'm volunteering.",
    is_correct: true,
    feedback: '「やります。志願します。」<br>"I \'ll do it" で即断の意思を示してから "I \'m volunteering" で正式な志願を重ねる構造です。"volunteer" を動詞で使うことで「自ら進んで申し出る」という能動的な意思が明確になります。沈黙を破る一言として、短く力強い響きがあります。'
  },
  {
    body: 'I \'ll run for it.',
    is_correct: false,
    feedback: '「やってみます。」<br>"run for ~" は「〜に立候補する・〜を目指して走る」という表現です。"run for president"（大統領選に出馬する）のように、選挙や競争の文脈で使われることが多く、宇宙ミッションへの志願としては少しズレたニュアンスになります。'
  },
  {
    body: "The buck stops here.",
    is_correct: false,
    feedback: '「責任はここで止まる。」<br>トルーマン大統領が残した有名な一言です。「最終的な責任は自分が取る」という覚悟を示す表現です。本来はリーダーが責任の所在を宣言する言葉であり、すでに立場のある人間が腹をくくる言葉なので、名乗り出る場面には少し合いません。'
  }
])

# --- STEP 4 ---
step4 = situation.steps.create!(
  step_number: 4,
  body: '打ち上げ直前。発射台に向かうリオは振り返り、見送りに来た地上チームへ最後の通信を入れます。<br>「あとは任せた。行ってきます」と言いたい時に適切なフレーズを選びましょう。'
)

step4.choices.create!([
  {
    body: 'I \'m leaving the rest to you. Here I go.',
    is_correct: true,
    feedback: '「あとは任せた。行ってきます。」<br>"leave the rest to you" は「残りを委ねる」という表現で、自分の役割を果たした上で後を託すニュアンスがあります。"Here I go" は出発の瞬間の自然な一言で、悲壮感より前向きな踏み出しの感覚があります。'
  },
  {
    body: 'I will now proceed to execute the mission. Goodbye.',
    is_correct: false,
    feedback: '「ミッションを遂行します。さようなら。」<br>意味は正確ですが、"proceed" "execute" "Goodbye" という無機質な語の連なりが感情的な場面とややミスマッチです。淡々と事務連絡をしているようで、地上チームは泣けません。'
  },
  {
    body: 'To infinity and beyond.',
    is_correct: false,
    feedback: '「無限の彼方へ、さあ行くぞ。」<br>映画『トイ・ストーリー』でバズ・ライトイヤーの決め台詞です。宇宙へ飛び立つ文脈でこれ以上ハマる台詞はなく、むしろ適切かも・・・。'
  }
])

puts "Seed data created successfully!"
puts "Situations: #{Situation.count}"
puts "Steps: #{Step.count}"
puts "Choices: #{Choice.count}"
