return {
    descriptions = {
        Back = {
            b_dckst_permission = {
                name = "パーミッションデッキ",
                text = {
                    '{C:attention,T:v_dckst_expansionpermit}エクスパンションパーミット{}と',
                    '{C:attention,T:v_dckst_prestigepermit}プレステージパーミット{}で',
                    'スタートする'
                }
            },
            b_dckst_decimal = {
                name = "デシマルデッキ",
                text = {
                    "{X:attention,C:white}X0.75{} すべてのブラインド要求値、",
                    "{C:red}ディスカード -1{}、{C:red}{} {C:blue}ハンド -1{}、",
                    "{C:red}ジョーカースロット -1{}、",
                    "{C:red}消耗スロット -1{}"
                }
            },
            b_dckst_hard = {
                name = "ハードデッキ",
                text = {
                    "{X:attention,C:white}X1.2{} すべてのブラインド要求値、",
                    "{C:red}ディスカード -2{}、{C:red}{} {C:blue}ハンド -1{}、",
                    "{C:red}ジョーカースロット -1{}、",
                    "{C:red}消耗スロット -1{}"
                }
            },
            b_dckst_graceful = {
                name = "グレースフルデッキ",
                text = {
                    "{V:1,T:c_dckst_abyssinian}アビシニアン{} を2枚と",
                    "{C:attention}4{} 消耗スロットで",
                    "ランをスタートする。{V:1}キャタロット{} が",
                    "ショップに {B:1,C:white}X3{} の頻度で出現する"
                }
            },
            b_dckst_futuristic = {
                name = "フューチャリスティックデッキ",
                text = {
                    "{V:1,T:c_dckst_collective}COLLECTIVE.{} と",
                    "{C:attention}4{} 消耗スロットで",
                    "ランをスタートする。",
                    "{V:1}ネオタロット{} がショップに",
                    "{B:1,C:white}X3{} の頻度で出現する"
                }
            },
            b_dckst_rail = {
                name = "レイルデッキ",
                text = {
                    '{V:1,T:c_dckst_route_19}ルート19{} を',
                    '2枚持ってスタートする、',
                    "{V:1}ルート{} がショップに",
                    "{B:1,C:white}X2{} の頻度で出現する"
                }
            },
            b_dckst_spectacle = {
            name = "スペクタクルデッキ",
            text = {
                "{C:dckst_spectaclaw,T:c_dckst_manekineko}まねきねこ！{} を",
                "持ってスタートする、",
                "{C:dckst_spectaclaw}スペクタクロウ{} カードが",
                "ショップに出現する可能性がある、",
                "{C:attention}アンティ10{} で勝利"
                }
            },
            b_dckst_fresh = {
                name = 'フレッシュデッキ',
                text = {
                    'ショップのジョーカーは',
                    '固定で {C:green}6分の1{} の確率で',
                    '{C:attention,T:dckst_evergreen}エバーグリーン{} ステッカーが付く',
                },
            },
             b_dckst_gigglers = {
                name = 'ギグラーズデッキ',
                text = {
                    'ショップのジョーカーは',
                    '固定で {C:green}4分の1{} の確率で',
                    '{C:attention,T:dckst_smiley,T_vars:9}スマイリー{} ステッカーが付く',
                },
            },
            b_dckst_twin = {
                name = 'ツインデッキ',
                text = {
                    '各ランクを {C:attention}2{} 枚ずつ持って',
                    'ランをスタートする、',
                    'デッキに {C:red}フェイスカードはない{}'
                }
            },
            b_dckst_overclocked = {
                name = 'オーバークロックデッキ',
                text = {
                    'ラウンドごとに {C:blue}ハンド +2{} と',
                    '{C:red}ディスカード +2{}、',
                    'ハンドをプレイするたびに',
                    '必要チップが {C:attention}15%{} 増加する',
                }
            },
            b_dckst_h = {
                name = 'Hデッキ',
                text = {
                    'デッキ内のすべての {C:attention}ナンバーカード{} が',
                    '{C:enhanced,T:m_dckst_h}Hカード{} として始まる、',
                    '{C:attention,T:c_dckst_minuet}メヌエット{} を持ってスタートする'
                }
            },
            b_dckst_microchip = {
                name = "マイクロチップデッキ",
                text = {
                    'デッキ内のすべてのカードは',
                    '固定で {C:green}5分の1{} の確率で',
                    '{C:attention,T:m_dckst_techno}テクノ{} カードとして始まる',
                }
            },
            b_dckst_consumer = {
                name = 'コンシューマーデッキ',
                text = {
                    '{C:attention}5{} 消耗スロットと',
                    'それぞれからランダムな {C:attention}1{} 枚を持ってスタートする：',
                    '{C:tarot}タロット{}、{C:planet}惑星{}、{V:1}キャタロット{}、',
                    '{V:2}ネオタロット{}、{V:3}ルート{}',
                }
            },
            b_dckst_stellation = {
                name = "ステレーションデッキ",
                text = {
                    '{C:attention,T:v_dckst_meow}meow!{}、',
                    '{C:attention,T:v_dckst_new_major}ニューメジャー{}、{C:attention,T:v_dckst_double_track}ダブルトラック{}、',
                    '{C:attention,T:v_overstock_norm}オーバーストック{}、{C:attention,T:v_overstock_plus}オーバーストックプラス{} を',
                    '持ってスタートする'
                }
            },
            b_dckst_shopping = {
                name = "ショッピングデッキ",
                text = {
                    '{C:attention}2{} 個のランダムな',
                    'タグを持ってランをスタートする',
                }
            },
            b_dckst_overdraft = {
                name = "オーバードラフトデッキ",
                text = {
                    '{C:money}$2{} を持って',
                    '{C:money}スタート{} する',
                    '最初の {C:attention}3{} 回のショップ',
                    '{C:attention}リロール{} は {C:money}無料{}',
                }
            },
            b_dckst_ledeck = {
                name = 'ルデック',
                text = {
                    "すべての {C:attention}2{}、{C:attention}3{}、{C:attention}6{} が",
                    "{C:enhanced,T:m_dckst_lebronned}ルブロンドカード{} として始まり",
                    "スコアされた時 {X:mult,C:white} X3 {} 倍率を与える"
                }
            },
            b_dckst_inflated = {
                name = "インフレーテッドデッキ",
                text = {
                    "すべての {C:attention}ジョーカー{} と",
                    "{C:attention}消耗{} カードのセルバリューが {C:money,s:1.1,E:1}3倍{} になる"
                }
            },
            b_dckst_bureaucracy = {
                name = "ビューロクラシーデッキ",
                text = {
                    "{C:attention,T:v_dckst_double_downer}ダブルダウナー{} を持ってスタートする",
                    "{C:attention}バウチャー{} が {C:green}半額{} になる",
                    "その他のアイテムはすべて {X:attention,C:white}X1.5{} 高くなる"
                }
            },
            b_dckst_nomad = {
                name = "ノマドデッキ",
                text = {
                    "リロールのたびに {C:money}$2{} かかる",
                    "すべてのショップアイテムが",
                    "{X:attention,C:white}X2{} 高くなる",
                    "{C:inactive}（セルバリューには影響しない）{}"
                }
            },
            b_dckst_austerity = {
                name = "オースタリティデッキ",
                text = {
                    "{C:red}$-50{} でスタートする",
                    "ブラインドの報酬金が",
                    "{X:money,C:white}X2{} 増える"
                }
            },
            b_dckst_minimalist = {
                name = "ミニマリストデッキ",
                text = {
                    "{C:attention}7{} 未満のランクは",
                    "すべてデッキから取り除かれる",
                    "{C:red}ハンドサイズ -1{}"
                }
            },
            b_dckst_refined = {
                name = "リファインドデッキ",
                text = {
                    "{C:attention}フェイスカード{} はスコアされた時",
                    "{C:mult}+10{} 倍率も与える",
                    "その他のすべてのランクは",
                    "{C:chips}+0{} ベースチップになる"
                }
            },
            b_dckst_lightbulb = {
                name = "ライトバルブデッキ",
                text = {
                    '{C:attention,E:2,s:1.1}ワンショット{} でブラインドを倒すと',
                    '{X:money,C:white}X$1.5{} 得る、ブラインドを倒しても',
                    '報酬は得られない'
                }
            },
            b_dckst_handy = {
                name = "ハンディデッキ",
                text = {
                    '{C:attention,T:v_dckst_extra_digits}エクストラデジッツ{} と',
                    '{C:attention,T:v_dckst_ambidextrous}アンビデクストラス{} を持ってスタートする、',
                    '{C:red}ハンドサイズ -1{}'
                }
            },
            b_dckst_decksterity_fancy = {
                name = "ファンシーデッキ",
                text = {
                    '{C:common}コモン{} ジョーカーは',
                    '{C:attention}ショップ{} に',
                    '出現しない',
                }
            },
            b_dckst_metallurgic = {
                name = "メタラージックデッキ",
                text = {
                    'すべてのカードに',
                    'ランダムな {C:attention}メタラージック{}',
                    '強化が付く',
                }
            },
            b_dckst_binary = {
                name = 'バイナリデッキ',
                text = {
                    'デッキには {C:attention}10が26枚{}',
                    'と {C:attention}エースが26枚{} ある',
                    '{C:inactive}（スーツはランダム）{}',
                }
            },
            b_dckst_marathon = {
                name = "マラソンデッキ",
                text = {
                    "ブラインドの要求値の",
                    "スケーリングが {C:attention}25%{} 遅くなる、",
                    "{C:attention}アンティ12{} で勝利"
                }
            },
            b_dckst_monarch = {
                name = "モナークデッキ",
                text = {
                    'すべての {C:attention}フェイス{} カードは',
                    'スコアされた時 {X:mult,C:white}X1.5{} 倍率、',
                    '{C:attention}それ以外{} のランクは {X:mult,C:white}X0.7{} 倍率を与える'
                }
            },
            b_dckst_blueprint = {
                name = "ブループリントデッキ",
                text = {
                    '{C:attention}ブラインド{} を倒すと {C:attention}3{} 枚の',
                    'ランダムなジョーカーが出現する',
                    '{C:inactive}（空きが必要）{}、',
                    'ショップには {C:red,E:2}もう{} ジョーカーが並ばない'
                }
            },
            b_dckst_fragile = {
                name = 'フラジャイルデッキ',
                text = {
                    '{C:money}$20{} と',
                    '各 {C:attention}ランク{} の追加コピーを',
                    '{C:attention}1{} 枚持ってスタートする。',
                    'スタート時のすべてのカードは',
                    '{C:attention,T:m_glass}グラス{} になる'
                }
            },
            b_dckst_microwave = {
                name = 'マイクロウェーブデッキ',
                text = {
                    '各ラウンド開始時に最もプレイした',
                    'ハンドが {C:attention,E:1,s:1.1}レベルアップ{} する、',
                    'プレイされたカードはそれぞれ固定で',
                    '{C:green}6分の1{} の確率で',
                    '{C:red,E:2}破壊{} される'
                }
            },
            b_dckst_consecutive = {
                name = 'コンセキュティブデッキ',
                text = {
                    '{C:attention}ストレート{} のみを',
                    '含むハンドしか',
                    'プレイできない',
                }
            },
            b_dckst_deadline = {
                name = 'デッドラインデッキ',
                text = {
                    '{C:attention}6{} {C:red}ディスカード{} と',
                    '{C:attention}2{} {C:blue}ハンド{} を持ってスタートする',
                }
            },
            b_dckst_plaintext = {
                name = 'プレーンテキストデッキ',
                text = {
                    '{C:attention}ベース{} カード',
                    '（強化なし）はそれぞれ',
                    '{X:mult,C:white} X1.5 {} 倍率を与える',
                }
            },
            b_dckst_decksterity_icosagon = {
                name = 'イコサゴンデッキ',
                text = {
                    '{C:inactive}（バニラ）{} {C:attention}スーツ{} ごとに',
                    '{C:enhanced}強化された{} {C:attention}20{} を',
                    '2枚持ってスタートする',
                }
            },
            b_dckst_decksterity_hexadeck = {
                name = 'ヘクサデック',
                text = {
                    'すべての {C:attention,T:tag_double}ダブルタグ{} が',
                    '{C:attention,T:tag_dckst_sextuple}セクスタプルタグ{} に置き換わる、スキップした',
                    'ブラインドごとに {C:red}-$4{}'
                }
            },
            b_dckst_decksterity_heptadeck = {
                name = 'ヘプタデック',
                text = {
                    'すべての {C:attention,T:tag_double}ダブルタグ{} が',
                    '{C:attention,T:tag_dckst_septuple}セプタプルタグ{} に置き換わる、スキップした',
                    'ブラインドごとに {C:red}-$6{}'
                }
            },
        },
        Blind = {
            bl_dckst_secant = {
                name = "セカント",
                text = {
                    '強化されたカードが',
                    'X#1# 倍率を与える'
                }
            },
            bl_dckst_cosecant = {
                name = "コセカント",
                text = {
                    'ベースカードが',
                    'X#1# 倍率を与える'
                }
            },
            bl_dckst_foreclosure = {
                name = 'フォークロージャー',
                text = {
                    "セルバリューが $#1# を超える",
                    "ジョーカーはデバフされる"
                }
            },
            bl_dckst_vandal = {
                name = 'ヴァンダル',
                text = {
                    'ハンドがプレイされた時、',
                    '一番左のジョーカーが破壊される'
                }
            },
            bl_dckst_magpie = {
                name = 'マグパイ',
                text = {
                    'ランクが7以上の',
                    'カードしか',
                    'プレイできない'
                }
            },
            bl_dckst_hypochondriac = {
                name = 'ヒポコンドリアック',
                text = {
                    'シールの付いたカードは',
                    'デバフされる'
                }
            },
            bl_dckst_harmony = {
                name = 'ハーモニー',
                text = {
                    'プレイするカードは',
                    'すべて同じランクか',
                    'スーツでなければならない'
                }
            },
            bl_dckst_inflationism = {
                name = 'インフレーショニズム',
                text = {
                    'カードがディスカードされると、',
                    'ブラインド要求値が',
                    'X#1# 増加する'
                }
            },
            bl_dckst_miser = {
                name = 'マイザー',
                text = {
                    '所持金が $#1# に固定され、',
                    'ラウンド中は',
                    '変化しない'
                }
            },
            bl_dckst_numismatist = {
                name = 'ヌミスマティスト',
                text = {
                    '所持金が奇数の場合のみ',
                    'ハンドがスコアされる',
                    '{C:inactive}（小数は無視される）{}'
                }
            },
            bl_dckst_pendulum = {
                name = 'ペンデュラム',
                text = {
                    'ハンドがスコアされる前に、',
                    'ハンドごとにチップと倍率を',
                    '交互に半減させる'
                }
            },
            bl_dckst_derivative = {
                name = "デリバティブ",
                text = {
                    "ストレートを含む",
                    "ハンドは",
                    "プレイできない"
                }
            },
            bl_dckst_integral = {
                name = "インテグラル",
                text = {
                    "ストレートを含まない",
                    "ハンドは",
                    "プレイできない"
                }
            },
            bl_dckst_distance = {
                name = "ディスタンス",
                text = {
                    "ハンドごとにスコア要求値が",
                    "X#1# 増加する"
                }
            },
            bl_dckst_scalage = {
                name = 'スケイレージ',
                text = {
                    'プレイしたすべてのカードの',
                    'ランクの合計が',
                    '#1# 以上でなければならない'
                }
            },
            bl_dckst_containment = {
                name = 'コンテインメント',
                text = {
                    '手札の左端と右端の2枚は',
                    'デバフされ、',
                    'カードをドラッグできない'
                }
            },
            bl_dckst_switchie = {
                name = 'スウィッチー',
                text = {
                    '手札で奇数番目の',
                    '位置にあるカードは',
                    '裏向きでドローされる、',
                    'カードをドラッグやソートできない'
                }
            },
            bl_dckst_antivowelist = {
                name = 'アンチボウェリスト',
                text = {
                    '#1#~#2#個の母音を含む',
                    'ジョーカーはデバフされる',
                    '{s:0.8}[A、E、I、O、U、Y]{}'
                }
            },
            bl_dckst_moneycharger = {
                name = 'マネーチャージャー',
                text = {
                    'ハンドがプレイされた時、-$#1#'
                }
            },
            bl_dckst_storage = {
                name = 'ストレージ',
                text = {
                    "所持金 $#1# ごとに",
                    "ハンドサイズ -1",
                    "{C:inactive}（最低ハンドサイズ #2#）{}"
                }
            },
            bl_dckst_leftovers = {
                name = 'レフトオーバーズ',
                text = {
                    'ラウンド終了時、プレイしなかった',
                    'カード1枚につき $0.5 失う',
                    '{C:inactive}（切り捨て）'
                }
            },
            bl_dckst_randomization = {
                name = 'ランダマイゼーション',
                text = {
                    'ハンドごとにランダムな',
                    'ランクがデバフされる'
                }
            },
            bl_dckst_tether = {
                name = 'テザー',
                text = {
                    'プレイするハンドには',
                    '手札の最高ランクを含まなければならない'
                }
            },
            bl_dckst_tariffication = {
                name = 'タリフィケーション',
                text = {
                    'カードをディスカードするごとに',
                    '$#1# 失う'
                }
            },
            bl_dckst_counterfeit = {
                name = 'カウンターフィット',
                text = {
                    'エディションの付いたジョーカーと',
                    'トランプカードはデバフされる'
                }
            },
            bl_dckst_adblock = {
                name = 'アドブロック',
                text = {
                    '強化、シール、エディションの',
                    '付いたトランプカードは',
                    '裏向きでドローされる'
                }
            },
            bl_dckst_primetime = {
                name = 'プライムタイム',
                text = {
                    'ハンドには素数のランクを',
                    '持つカードを含まなければならない'
                }
            },
            bl_dckst_squarism = {
                name = 'スクエアリズム',
                text = {
                    'ハンドがスコアされる前に、',
                    'チップは最も近い',
                    '平方数に切り捨てられる'
                }
            },
            bl_dckst_octanium = {
                name = 'オクタニウム',
                text = {
                    '説明文に8または9という',
                    '数字を含むジョーカーか',
                    'トランプカードをデバフする（可能な場合）',
                }
            },
            bl_dckst_giggling = {
                name = 'ギグリング',
                text = {
                    'プレイするハンドには',
                    '最低 #1# 枚のフェイスカードを',
                    '含まなければならない'
                }
            },
            bl_dckst_chartreuse_coin = {
                name = 'シャルトルーズコイン',
                text = {
                    'カードがスコアされるたびに X$0.97'
                }
            },
            bl_dckst_silver_shield = {
                name = 'シルバーシールド',
                text = {
                    'カードがスコアされるたびに',
                    'X#1# ブラインド要求値'
                }
            },
            bl_dckst_sapphire_sword = {
                name = 'サファイアソード',
                text = {
                    'ベースチップと倍率が',
                    '#1# に固定される'
                }
            },
            bl_dckst_vermillion_rose = {
                name = 'ヴァーミリオンローズ',
                text = {
                    '最終倍率が',
                    '残りの{C:blue}ハンド{}と{C:red}ディスカード{}の',
                    '合計で割られる',
                    '{C:inactive}（0の場合は何も起こらない）{}'
                }
            },
            bl_dckst_dandelion_arrow = {
                name = 'ダンデライオンアロー',
                text = {
                    '左から #1# 番目までの',
                    'ジョーカーが永久にデバフされる'
                }
            },
            bl_dckst_periwinkle_feline = {
                name = 'ペリウィンクルフィライン',
                text = {
                    'このランで使用した',
                    'キャタロット1枚につき X#1# スコア要求値'
                }
            },
            bl_dckst_pyrite_ball = {
                name = 'パイライトボール',
                text = {
                    '消耗カードを #1# 枚使用するまで',
                    'すべてのジョーカーと',
                    'トランプカードがデバフされる'
                }
            },
            bl_dckst_tyler_the_finisher = {
                name = 'タイラー・ザ・フィニッシャー',
                text = {
                    'スコアされるハンドは毎回ランダムに',
                    'より低ランクの有効なポーカーハンドに',
                    '置き換えられる'
                }
            },
            bl_dckst_amethyst_amulet = {
                name = 'アメジストアミュレット',
                text = {
                    'カードがディスカードされると、',
                    'その半分（切り上げ）が',
                    '破壊される'
                }
            },
            bl_dckst_leafy_limit = {
                name = 'リーフィーリミット',
                text = {
                    'カード選択上限が #1#、',
                    'ハンドサイズが #1#'
                }
            },
            bl_dckst_onyx_obelisk = {
                name = 'オニキスオベリスク',
                text = {
                    '既にプレイ済みのハンドタイプが',
                    'プレイされた時、',
                    'ベースチップと倍率が',
                    'X#1# になる{C:inactive}（累積）{}'
                }
            },
            bl_dckst_diamond_die = {
                name = 'ダイヤモンドダイ',
                text = {
                    'ハンドには #1# を',
                    '含まなければならない、ランクは',
                    'ハンドごとに変わる'
                }
            },
            bl_dckst_fervent_fern = {
                name = 'ファーヴェントファーン',
                text = {
                    'カードを #1# 枚プレイするまで',
                    'すべてのカードがデバフされる'
                }
            },
            bl_dckst_hypnotic_haze = {
                name = 'ヒプノティックヘイズ',
                text = {
                    'すべてのジョーカーが裏向きになり、',
                    'すべてのジョーカーとトランプカードが',
                    '3秒（ゲーム内時間）ごとに',
                    'ランダムに位置を変える'
                }
            },
            bl_dckst_calculator_core = {
                name = 'カリキュレーターコア',
                text = {
                    'プレイしたすべてのカードの',
                    'ランクの合計が',
                    '#1# から #2# の間でなければならない'
                }
            },
            bl_dckst_shorted_signal = {
                name = 'ショーテッドシグナル',
                text = {
                    'プレイしたハンドが要求スコアの',
                    '#1#%を超えた場合、',
                    'ランに敗北する'
                }
            },
            bl_dckst_malignant_monument = {
                name = 'マリグナントモニュメント',
                text = {
                    'とてつもなく大きいブラインド'
                }
            },
            bl_dckst_total_terminal = {
                name = 'トータルターミナル',
                text = {
                    'すべての {X:mult,C:white}X倍率{} ジョーカーが',
                    'デバフされる（可能な場合）'
                }
            },
            bl_dckst_versatile_versine = {
                name = 'ヴァーサタイルヴァーサイン',
                text = {
                    'カードがスコアされるたびに X#1# チップ、',
                    'ジョーカーが発動するたびに',
                    'X#2#',
                    '倍率'
                }
            },
            bl_dckst_withering_well = {
                name = '枯渇の井戸',
                text = {
                    '手札をプレイするたび',
                    'その終了時に所持金が',
                    '半分になる（切り捨て）'
                }
            },
            bl_dckst_molten_mass = {
                name = '溶融塊',
                text = {
                    'プレイされたカードは',
                    '得点計算前に強化、シール、',
                    'エディションを全て失う'
                }
            },
            bl_dckst_gravity_gate = {
                name = '重力の門',
                text = {
                    'ハンドサイズが',
                    '半分になる（切り捨て）'
                }
            },
        },
        Joker = {
            j_dckst_fiesta = {
                name = "フィエスタ！",
                text = {
                    'スコアされた{C:clubs}クラブ{}は{C:chips}+#1#{}チップ、',
                    'スコアされた{C:hearts}ハート{}は{C:mult}+#2#{}倍率、',
                    'スコアされた{C:diamonds}ダイヤ{}は{C:money}+$#3#{}を与える'
                }
            },
            j_dckst_inset = {
                name = "インセットジョーカー",
                text = {
                    'ハンドがスコアされた時、空いている',
                    '{C:attention}ジョーカースロット{}1つにつき',
                    'このジョーカーは{C:mult}+2{}倍率を得る',
                    '{C:inactive}（現在{C:mult}+#2#{}{C:inactive}倍率）{}',
                    '{C:inactive}（空きスロット#3#個）{}'
                }
            },
            j_dckst_slippin_jimmy = {
                name = "スリッピン・ジミー",
                text = {
                    '{C:attention}ボスブラインド{}がカードを',
                    'デバフした時、{C:green}#2#分の#1#{}の',
                    '確率で無視する',
                }
            },
            j_dckst_prismatic = {
                name = "プリズマティックジョーカー",
                text = {
                    'スコアされたカードに',
                    '{C:dark_edition}エディション{}が付いていると',
                    'このジョーカーは{C:mult}+10{}倍率を得る',
                    '{C:inactive}（現在{C:mult}+#2#{}{C:inactive}倍率）{}'
                }
            },
            j_dckst_loadeddice = {
                name = "ローデッドダイス",
                text = {
                    'スコアされた{C:attention}非ラッキー{}の{C:attention}6{}は',
                    'すべて{C:attention}ラッキーカード{}に変換される'
                }
            },
            j_dckst_swapped = {
                name = "スワップドジョーカー",
                text = {
                    'プレイされた{C:hearts}ハート{}を',
                    '{C:clubs}クラブ{}に、{C:diamonds}ダイヤ{}を{C:spades}スペード{}に、',
                    '{C:clubs}クラブ{}を{C:hearts}ハート{}に、',
                    '{C:spades}スペード{}を{C:diamonds}ダイヤ{}に変換する'
                }
            },
            j_dckst_stopsign = {
                name = "ストップサイン",
                text = {
                    '現在の{C:attention}ボスブラインド{}',
                    'の効果を入場時に無効化し、',
                    'その後{C:mult}自壊{}する'
                }
            },
            j_dckst_extruded = {
                name = "エクストルーデッドジョーカー",
                text = {
                    "カードが破壊または売却されるたびに",
                    "このジョーカーは{X:mult,C:white}+X#1#{}倍率を得る",
                    "{C:inactive}（現在{X:mult,C:white}X#2#{}{C:inactive}倍率）{}",
                    "{C:inactive}（破壊/売却されたカード：#3#枚）{}"
                }
            },
            j_dckst_pencil = {
                name = "ペンシル",
                text = {
                    "カードが強化された時",
                    "このジョーカーは{C:chips}+#1#{}チップを得る",
                    "{C:inactive}（現在{C:chips}+#2#{C:inactive}チップ）{}"
                }
            },
            j_dckst_floatingisland = {
                name = 'フローティングアイランド',
                text = {
                    'ハンドがプレイされた時、',
                    '{C:common}コモン{}ジョーカー1枚につき',
                    'このジョーカーは{C:chips}+#1#{}チップを得る',
                    '{C:inactive}（現在{C:chips}+#2#{}{C:inactive}チップ）{}'
                }
            },
            j_dckst_frontier = {
                name = 'フロンティア',
                text = {
                    'このジョーカーの{C:attention}右{}にある',
                    'ジョーカーは{C:mult}+#1#{}倍率を与え',
                    'このジョーカーの{C:attention}左{}にある',
                    'ジョーカーは{C:chips}+#2#{}チップを与える',
                }
            },
            j_dckst_coffee_mug = {
                name = "コーヒーマグ",
                text = {
                    "各ラウンド{C:attention}+#1#{}ハンドサイズで",
                    "始まる。ハンドをプレイするたびに",
                    "{C:attention}-1{}ハンドサイズ",
                    "減少する",
                }
            },
            j_dckst_lilmaxey = {
                name = "{C:dark_edition,E:dckst_rainbow_wiggle}lil' maxey!{}",
                text = {
                    'このジョーカーの{C:attention}左{}にある',
                    'ジョーカーは{E:1}この猫{}に{X:mult,C:white}X#1#{}倍率を与え{}',
                    'ハンドがプレイされるたびに',
                    'この猫も{X:mult,C:white}+X#2#{}倍率を得る',
                    '{C:inactive}（現在{X:mult,C:white}X#3#{}{C:inactive}倍率）{}'
            },
        },
        j_dckst_cyanotype = {
            name = "サイアノタイプ",
            text = {
                    '{C:attention}#1#{}{C:blue}ハンド{}後に',
                    '{C:attention,E:1,s:1.1}一番左{}の所持ジョーカーの',
                    'コピーを作り',
                    'その後{C:red}自壊{}する',
                    '{C:inactive}（現在{C:attention}#2#{}{C:inactive}/#1#ハンド）{}'
            },
        },
        j_dckst_superstar = {
            name = "スーパースター",
            text = {
                    '{C:attention}ブラインド{}を倒すごとに',
                    'このジョーカーは{C:mult}+#1#{}',
                    '倍率を得る',
                    '{C:inactive}（現在{C:mult}+#2#{}{C:inactive}倍率）{}'
            }
        },
        j_dckst_theknicks = {
            name = "THE KNICKS-",
            text = {
                    'すべての{C:green,E:1,s:1.1}確率{}の',
                    '{C:green,E:1,s:1.1}分子{}を{C:attention}3倍{}にするが、',
                    'ラウンド終了時に固定で',
                    '{C:green}8分の1{}の確率で',
                    '{C:red}爆発{}する'
            }
        },
        j_dckst_shoreline = {
            name = "ショアライン",
            text = {
                    '各ラウンド{C:attention}開始{}時に',
                    'このジョーカーは{C:chips}+#1#{}',
                    'チップを得るが、',
                    '{C:blue}ハンド{}をプレイするたびに',
                    '{C:red}-#2#{}チップ失う',
                    '{C:inactive}（現在{C:chips}+#3#{}{C:inactive}チップ）{}'
            }
        },
        j_dckst_typewriter = {
            name = "タイプライター",
            text = {
                '{C:green}#2#分の#1#{}の確率で',
                'スコアされた{C:attention}フェイスカード{}を',
                'デッキに{C:attention}コピー{}する'
            }
        },
        j_dckst_luckykitten = {
            name = "ラッキーキトゥン",
            text = {
                '{C:attention}ラッキー{}カードがスコアされると',
                '{C:chips}+#1#{}チップ、',
                '{C:attention}#2#{}{C:blue}ハンド{}後に',
                '{C:attention}ラッキーキャット{}に進化する',
                '{C:inactive}（{}{C:attention}#3#{}{C:inactive}/#2#ハンド）{}'
            }
        },
        j_dckst_airbornepiano = {
            name = "エアボーンピアノ",
            text = {
                '{X:mult,C:white}X#1#{}倍率、カードが',
                'スコアされるたびに{X:mult,C:white}-X#2#{}倍率を失う'
            }
        },
        j_dckst_pathogen = {
            name = "パソジェン",
            text = {
                    'ラウンドの最初の{C:blue}ハンド{}が',
                    'ちょうど{C:attention}2{}枚の固定カードの場合、',
                    '左のカードを{C:attention}2回コピー{}する'
            }
        },
        j_dckst_pawprints = {
            name = "ポウプリンツ",
            text = {
                    '{C:blue}ハンド{}のスコア計算が',
                    '終わった時、{C:green}#2#分の#1#{}の',
                    '確率で{C:attention}スコアされた{}カードが',
                    'ランダムな{C:enhanced}強化{}を受ける'
            }
        },
        j_dckst_mysterioustrail = {
            name = "ミステリアストレイル",
            text = {
                    '{C:mult}+#1#{}倍率、{C:attention}#2#{}',
                    '{C:blue}ハンド{}後に{C:attention}4種類の',
                    'ジョーカーのいずれか{}にランダムに進化する',
                    '{C:inactive}（{}{C:attention}#3#{}{C:inactive}/#2#ハンド）{}'
            }
        },
        j_dckst_tamerlane = {
            name = "タメルレーン",
            text = {
                'カードがあるスーツから別のスーツに',
                '{C:attention}変換{}されると',
                'このジョーカーは{X:mult,C:white}+X#2#{}倍率を得る',
                '{C:inactive}（現在{X:mult,C:white}X#1#{}{C:inactive}倍率）{}',
            }
        },
        j_dckst_therook = {
            name = 'THE ROOOOOOOOOOOOOOOOOOOOOOOOOOOOK',
            text = {
                'ラウンド終了時、このジョーカーは',
                '{C:attention}一番左{}のジョーカーを破壊し',
                '{X:mult,C:white}+X#2#{}倍率を得る',
                '{C:inactive}（現在{X:mult,C:white}X#1#{}{C:inactive}倍率）{}',
            }
        },
        j_dckst_appraisal = {
            name = "アプレイザル",
            text = {
                    'ハンドがスコアされた後、',
                    '{C:attention}右端{}のトランプカードを破壊し',
                    '{C:money}+$#1#{}、{C:attention}強化{}、',
                    '{C:attention}シール{}、{C:attention}エディション{}のいずれかが',
                    '付いている場合は代わりに{C:money}+$#2#{}を与える',
            }
        },
        j_dckst_giggler = {
            name = "ギグラー",
            text = {
                    'このハンドでスコアされたユニークな',
                    '{C:attention}フェイスカード{}1枚につき',
                    'このジョーカーは{C:mult}+#1#{}倍率を得る',
                    '{C:inactive}（現在{C:mult}+#2#{}{C:inactive}倍率）{}'
            }
        },
        j_dckst_napkin = {
            name = "ナプキン",
            text = {
                '{X:mult,C:white}X#1#{}倍率',
                'ハンドごとに{C:green}#2#分の#3#{}の',
                '確率で{C:attention}ブレインストーム{}に',
                '進化する'
            }
        },
        j_dckst_son = {
            name = "SON",
            text = {
                'ラウンド終了時、手札にある',
                '{C:attention}ジャック{}1枚ごとに',
                '{C:green}#2#分の#1#{}の確率でランダムな',
                '{C:attention}強化{}を受ける',
            }
        },
        j_dckst_alchemist = {
            name = "アルケミスト",
            text = {
                'ジョーカーが{C:attention}売却{}されると',
                '{C:money}+$#1#{}セルバリューを得て、',
                '{C:attention}破壊{}されると',
                '{C:money}+$#2#{}セルバリューを得る',
            }
        },
        j_dckst_desklamp = {
            name = "デスクランプ",
            text = {
                'このジョーカーの{C:attention}右{}にある',
                'ジョーカー1枚につき',
                '{C:mult}+#1#{}倍率',
            }
        },
        j_dckst_stickynote = {
            name = "スティッキーノート",
            text = {
                'ラウンド終了時、',
                '{C:attention}ランダムな{}ジョーカー1枚に',
                '次のラウンドの間',
                '{C:mult}+#1#{}倍率{}を貼り付ける',
            }
        },
        j_dckst_coinjar = {
            name = "コインジャー",
            text = {
                '各ラウンド終了時に{C:money}+$#2#{}',
                '貯める（{C:attention}アンティ{}に',
                'よってスケールする）。',
                '{C:attention}ボスブラインド{}を倒すと',
                '{C:money}$#1#{}を吐き出す',
                '{C:inactive}（現在{C:money}$#1#{}{C:inactive}貯蓄）{}'
            }
        },
        j_dckst_cupboard = {
            name = "カップボード",
            text = {
                'スコアされたカードが与える{C:chips}チップ{}の',
                '{C:chips}半分{}を貯め、',
                'ハンド後に貯めた値を',
                '{C:mult}倍率{}として与える',
            }
        },
        j_dckst_thetown = {
            name = "ザ・タウン",
            text = {
                'ラウンド終了時に{C:money}$#1#{}を得る。',
                '所持金が{C:attention}0{}で終わる場合、',
                'このジョーカーは{C:chips}+#2#{}チップと',
                '{X:mult,C:white}X#3#{}倍率を与える'
            }
        },
        j_dckst_blkyn = {
            name = "BLKYN",
            text = {
            'プレイされたが{C:attention}スコアされなかった{}',
            'カードは{C:chips,E:1,s:1.1}1/ベース値{}を',
            '{X:mult,C:white}X倍率{}に加える',
            '{C:attention}ラウンド{}ごとにリセットされる',
            '{C:inactive}（現在{X:mult,C:white}X#1#{}{C:inactive}倍率）{}',
            }
        },
        j_dckst_peachtree = {
            name = "ピーチツリー",
            text = {
                'ハンドに{C:attention}ストレート{}と',
                '{C:attention}エース{}が含まれる場合、',
                '{E:1,s:1.1}Trae{}が{X:mult,C:white}X#1#{}倍率を与える',
            }
        },
        j_dckst_perrobabli = {
            name = "ペロバブリ",
            text = {
                'すべての{C:green,s:1.1,E:1}確率{}が',
                '{C:green}2分の1{}に',
                '寄せられる',
            }
        },
        j_dckst_quadratic_equation = {
            name = "クアドラティック・エクエーション",
            text = {
                '{C:attention}4{}枚カードがスコアされる',
                'ごとに{C:mult}+#2#{}倍率{}を得る',
                '倍率の増加量は{C:attention}4{}枚ごとに',
                '{C:mult}+2{}増加する',
                '{C:inactive}（現在{C:mult}+#1#{}{C:inactive}倍率）',
                '"{C:inactive}（{}{C:attention}#3#{}{C:inactive}枚スコア済み）{}',
            }
        },
        j_dckst_naturalist = {
            name = "ナチュラリスト",
            text = {
                'スコアされたカードはそれぞれ',
                '{C:green}#2#分の#1#{}の確率で',
                '{C:attention}ネイチャー{}カードになる',
            }
        },
        j_dckst_currency_exchange = {
            name = "カレンシーエクスチェンジ",
            text = {
                'スコア計算中に{C:chips}チップ{}と',
                '{C:mult}倍率{}を入れ替える',
            }
        },
        j_dckst_outline = {
            name = "アウトラインジョーカー",
            text = {
                '{C:attention}ジョーカー{}または{C:attention}消耗{}カードが',
                '売却または破壊されるたびに',
                '{C:mult}+#2#{}倍率を得る',
                '{C:inactive}（現在{C:mult}+#1#{}{C:inactive}倍率）{}'
            }
        },
        j_dckst_endpoints = {
            name = "エンドポインツ",
            text = {
                '{C:attention}一番左{}と',
                '{C:attention}一番右{}のスコアリングカードを',
                '{C:attention}2回{}再発動する',
            }
        },
        j_dckst_cantor_set = {
            name = "カントール集合",
            text = {
                '手札の{C:attention}中央3分の1{}を',
                '{C:red}破壊{}した後、',
                '残った手札の枚数の{C:chips}半分{}を',
                '{C:chips}チップ{}に掛ける',
                '{C:inactive}（現在{C:chips}+#1#{}{C:inactive}チップ）{}'
            }
        },
        j_dckst_einstein_tile = {
            name = "アインシュタイン・タイル",
            text = {
                'プレイしたハンドに{C:attention}異なるスーツ{}',
                'を持つカードが最低{C:attention}4{}枚',
                '含まれる場合{X:mult,C:white}+X#2#{}倍率',
                '{C:inactive}（現在{X:mult,C:white}X#1#{}{C:inactive}倍率）{}'
            }
        },


        -- H JOKERS
        j_dckst_majuscule = {
            name = "マジャスキュール",
            text = {
                'プレイしたハンドに{C:attention}ストレート{}が',
                '含まれる場合{X:mult,C:white}X#1#{}倍率'
            }
        },
        j_dckst_miniscule = {
            name = "ミニスキュール",
            text = {
                'プレイしたハンドに{C:attention}ストレート{}が',
                '含まれる場合{X:chips,C:white}X#1#{}チップ'
            }
        },

        -- TIER 3 EXCLUSIVE JOKERS, DO NOT TAMPER

        j_dckst_pillaring = {
            name = "ピラーリング",
            text = {
                'カードが{C:attention}スコアされる{}たびに',
                'このジョーカーは{X:dark_edition,C:white}+^#1#{}倍率を得る',
                '{C:inactive}（現在{}{C:inactive}{}{X:dark_edition,C:white}^#2#{}{C:inactive}倍率）{}'
            }
        },

    },
    Enhanced = {
        m_dckst_felious = {
            name = "フェリアスカード",
            text = {
                "{C:green}#2#分の#1#{}の確率で",
                "{C:attention}#3#{}回",
                "追加で再発動する"
            }
        },
        m_dckst_nature = {
            name = "ネイチャーカード",
            text = {
                '{C:red}+#1#{}倍率、{C:blue}+#2#{}追加チップ、',
                '{C:money}+$#3#{}'
            }
        },
        m_dckst_starry = {
            name = "スターリーカード",
            text = {
                "{C:green}#2#分の#1#{}の確率で",
                "スコアされた時にプレイした",
                "ハンドを{C:attention,E:1,s:1.1}レベルアップ{}する",
            }
        },
        m_dckst_random = {
            name = "ランダムカード",
            text = { '{C:mult}+#1#-#2#{}倍率' }
        },
        m_dckst_consecutive = {
            name = 'コンセキュティブカード',
            text = {
                'プレイしたハンドに',
                '{C:attention}ストレート{}が含まれる場合',
                '{X:mult,C:white}X#1#{}倍率を与える',
            }
        },
        m_dckst_striped = {
            name = "ストライプドカード",
            text = {
                'このカードはスコアされた時、',
                '{C:blue}+#1#{}追加チップまたは',
                '{C:red}+#2#{}倍率のどちらかを与える'
            }
        },
        m_dckst_lebronned = {
            name = 'ルブロンドカード',
            text = {
                '{C:chips}+#1#{}追加チップ、',
                '{C:mult}+#2#{}倍率'
            }
        },
        m_dckst_francaise = {
            name = "カルト・フランセーズ",
            text = {
                '{C:chips}+#1#{}追加チップ、',
                '{C:mult}+#2#{}倍率'
            }
        },
        m_dckst_serpentine = {
            name = "サーペンタインカード",
            text = {
                "スコア計算中に手札にある場合、",
                "{C:attention}#1#{}枚",
                "手札にドローする"
            }
        },
        m_dckst_giggling = {
            name = "ギグリングカード",
            text = {
                'ハンドにスコアされる',
                '{C:attention}フェイスカード{}がある場合',
                '{C:mult}+#1#{}倍率を得る',
                '{C:inactive}（現在{C:mult}+#2#{}{C:inactive}倍率）{}'
            }
        },
        m_dckst_techno = {
            name = "テクノカード",
            text = {
                "{C:mult}+#1#{}倍率を与える",
                "{C:green}#2#分の#3#{}の確率で",
                "スコアされた時にこのカードの",
                "倍率を{C:attention}#4#{}倍にする"
            }
        },
        m_dckst_icy = {
            name = "アイシーカード",
            text = {
                "{C:mult}+#1#{}倍率と",
                "{C:chips}+#2#{}追加チップを与える",
                "{C:attention}#3#{}回スコアすると溶ける",
                "{C:inactive}（#4#回使用済み）"
            }
        },
        m_dckst_h = {
            name = "Hカード",
            text = {
                'ハンドに{C:attention}ストレート{}が',
                '含まれる場合{C:mult}+#1#{}倍率、',
                'それ以外は{C:mult}+#2#{}倍率',
            }
        },
        m_dckst_onomatopoetic = {
            name = "オノマトペティックカード",
            text = {
                '{C:chips}+#1#{}追加チップ、または',
                '{C:mult}+#2#{}倍率、または{C:money}+$#3#{}',
            }
        },
        m_dckst_aluminum = {
            name = "アルミニウムカード",
            text = {
                "{C:chips}+#1#{}追加チップを与える",
                "ジョーカー1枚につき+{C:chips}#2#{}追加チップ",
                "手札のカード1枚につき+{C:mult}#3#{}倍率",
                "{C:inactive}（{C:chips}+#4#{}{C:inactive}、{C:mult}+#5#{}{C:inactive}）{}"
            }
        },
        m_dckst_potassium = {
            name = "ポタシウムカード",
            text = {
                "{C:mult}+#1#{}倍率、",
                "{C:green}#2#分の#3#{}の確率で",
                "スコアされた時に",
                "{C:red}自壊{}する"
            }
        },
        m_dckst_cobalt = {
            name = "コバルトカード",
            text = {
                '{X:mult,C:white}X#1#{}倍率、',
                'ランクなし、スーツなし、',
                '常にスコアされる'
            }
        },
        m_dckst_molybdenum = {
            name = "モリブデンカード",
            text = {
                'このカードは{C:attention}デバフされない{}、',
                '{C:chips}+#1#{}追加チップも',
                '与える'
            }
        },
        m_dckst_iridium  = {
            name = "イリジウムカード",
            text = {
                "{X:mult,C:white}X#1#{}倍率、{C:money}+$#2#{}",
            }
        },
        m_dckst_cerium = {
            name = "セリウムカード",
            text = {
                'スコアが{E:1,s:1.1,C:attention}炎上{}すると',
                '{C:chips}+#1#{}追加チップを得る',
            }
        },
    },
    Edition = {
        e_dckst_cosmic = {
            name = "コズミック",
            text = {
                'このカードのすべての値が',
                '{E:1,s:1.1,C:money}3倍{}になる',
                '{C:inactive}（可能な場合）{}'
            }
        },
        e_dckst_phosphorescent = {
            name = "フォスフォレセント",
            text = {
                '{C:mult}+#1#{}倍率、',
                '{X:chips,C:white}X#2#{}チップ'
            }
        },
        e_dckst_aetherescent = {
            name = 'エーテレセント',
            text = {
                '{C:blue}+#1#{}チップ、',
                '{X:red,C:white}X#2#{}倍率'
            }
        },
        e_dckst_iridescent = {
            name = 'イリデセント',
            text = {
                '{C:green}#2#分の#1#{}の確率で',
                'ランダムな{C:dark_edition}ネガティブ{}の',
                '{C:tarot}タロット{}、{V:1}キャタロット{}、',
                '{V:2}ネオタロット{}カードを作る'
            }
        },
        e_dckst_prismatic = {
            name = 'プリズマティック',
            text = {
                '{C:chips}+#1#{}チップ、',
                '{C:mult}+#2#{}倍率'
            }
        },
        e_dckst_wooden = {
            name = 'ウッデン',
            text = {
                '{C:dark_edition}+#1#{}ジョーカースロット'
            }
        },
    },
    Stake = {
        stake_dckst_dandy = {
            name = "ダンディステーク",
            text = {
                "ブースターパックのコストが",
                "アンティごとに{C:money}$1{}",
                "{C:attention}上がる{}",
                "{s:0.8}ブルーステークが適用される{}"
            }
        },
        stake_dckst_feline = {
            name = "フィラインステーク",
            text = {
                'ショップに{C:attention}ズーミー{}ジョーカーが出現する',
                '{C:inactive,s:0.8}（スコア前にランダムに位置が入れ替わる）{}',
                 "{s:0.8}ブルーステークが適用される{}"
            }
        },
        stake_dckst_chroma = {
            name = "クロマステーク",
            text = {
                '{C:dark_edition}エディション{}付きジョーカーの',
                '出現率が{X:dark_edition,C:white}X0.1{}になる',
                "{s:0.8}パープルステークとそれ以前が適用される{}"
            }
        },
        stake_dckst_clay = {
            name = "クレイステーク",
            text = {
                '{C:attention}ブラインド{}を選択すると、',
                'ランダムな未強化トランプカードがデッキに追加される',
                "{s:0.8}ゴールドステークとそれ以前が適用される{}"
            }
        },
        stake_dckst_storm = {
            name = "ストームステーク",
            text = {
                'プレイしたハンドに各ランク1枚だけしかない場合、',
                'そのハンドは{C:red}スコアされない{}',
                "{s:0.8}ゴールドステークが適用される{}"
            }
        },
        stake_dckst_fall = {
            name = "フォールステーク",
            text = {
                'ショップに{C:attention}デシデュアス{}ジョーカーが出現する',
                '{C:inactive,s:0.8}（8回発動後に破壊される）{}',
                 "{s:0.8}クレイステークとそれ以前が適用される{}"
            }
        },
        stake_dckst_cuprum = {
            name = "キュプラムステーク",
            text = {
                '{C:green}リロール{}のコストがアンティごとに{C:money}$1{}{C:attention}上がる{}',
                "{s:0.8}クレイステークとそれ以前が適用される{}"
            }
        },
        stake_dckst_silver = {
            name = "シルバーステーク",
            text = {
                '要求スコアが{C:attention}アンティ{}ごとに{C:attention}速くスケール{}する',
                "{s:0.8}フォールステークとそれ以前が適用される{}"
            }
        },
        stake_dckst_hollow = {
            name = "ホロウステーク",
            text = {
                'トランプカードはスコアされた時',
                '{X:mult,C:white}X0.9{}倍率と{X:chips,C:white}X0.95{}チップを与える',
                "{s:0.8}フォールステークとそれ以前が適用される{}"
            }
        },
        stake_dckst_solar = {
            name = "ソーラーステーク",
            text = {
                '{C:attention}3{}ラウンドごとに、所持している',
                'すべての{C:attention}消耗{}カードが{C:red}破壊{}される',
                "{s:0.8}シルバーステークとそれ以前が適用される{}"
            }
        },
        stake_dckst_lunar = {
            name = "ルナーステーク",
            text = {
                '{C:green}8分の1{}のカードが裏向きでドローされる',
                '{C:inactive}（固定確率）{}',
                "{s:0.8}シルバーステークとそれ以前が適用される{}"
            }
        },
        stake_dckst_satellite = {
            name = "サテライトステーク",
            text = {
                '{C:attention}ブラインド{}選択時、{C:attention}一番左{}の',
                'ジョーカーを一時的に{C:red}デバフ{}する',
                "{s:0.8}シルバーステークとそれ以前が適用される{}"
            }
        },
        stake_dckst_platina = {
            name = "プラティナステーク",
            text = {
                'すべてのジョーカーの{C:attention}セルバリュー{}が',
                '永久に{C:money}$0{}になる',
                "{s:0.8}ルナーステークとそれ以前が適用される{}"
            }
        },
        stake_dckst_bismuth = {
            name = "ビスマスステーク",
            text = {
                '勝利するにはアンティ{C:attention}12{}を倒す必要がある',
                "{s:0.8}ルナーステークとそれ以前が適用される{}"
            }
        },
        stake_dckst_solitaire = {
            name = "ソリテールステーク",
            text = {
                'ショップに{C:attention}ハルブド{}ジョーカーが出現する',
                '{C:inactive,s:0.8}（すべての値が半分になる、可能な場合）{}',
                "{s:0.8}プラティナステークとそれ以前が適用される{}"
            }
        },
        stake_dckst_h = {
            name = "Hステーク",
            text = {
                '{C:attention}8{}ラウンドごとに、ランダムな',
                '{C:attention}8{}枚のカードがデッキから{C:red}取り除かれる{}',
                "{s:0.8}プラティナステークとそれ以前が適用される{}"
            }
        },
        stake_dckst_atomic = {
            name = "アトミックステーク",
            text = {
                '要求スコアが{C:attention}アンティ{}ごとに{C:attention}さらに速く{}スケールする',
                "{s:0.8}プラティナステークとそれ以前が適用される{}"
            }
        },
        stake_dckst_jimbo  ={
            name = "ジンボステーク",
            text = {
                'ショップとブースターパックのすべてのジョーカーは',
                '{C:green}5分の1{}の確率でジョーカー「Jimbo」に',
                '置き換わる{C:inactive}（固定確率）{}',
                "{s:0.8}プラティナステークとそれ以前が適用される{}"
            }
        },
        stake_dckst_antimatter = {
            name = "アンチマターステーク",
            text = {
                '{C:red}ジョーカースロット -2{}',
                "{s:0.8}ソリテールステークとそれ以前が適用される{}"
            }
        },
        stake_dckst_shattered = {
            name = "シャッタードステーク",
            text = {
                'すべてのトランプカードとジョーカーは発動時、{C:green}3分の1{}の',
                '確率で破壊される',
                '{C:inactive}（固定確率）{}',
                "{s:0.8}ソリテールステークとそれ以前が適用される{}"
            }
        },
        stake_dckst_exalted = {
            name = "イグザルテッドステーク",
            text = {
                '偶数アンティ終了時に{C:money}所持金{}の',
                '{C:attention}67%{}を失う{C:inactive}（切り捨て）{}',
                "{s:0.8}ソリテールステークとそれ以前が適用される{}"
            }
        },
        stake_dckst_continual = {
            name = "コンティニュアルステーク",
            text = {
                '勝利するにはアンティ{C:attention}16{}を倒す必要がある',
                "{s:0.8}ソリテールステークとそれ以前が適用される{}"
            }
        },
        stake_dckst_universal = {
            name = "ユニバーサルステーク",
            text = {
                '要求スコアが{C:attention}アンティ{}ごとに{C:attention}非常に速く{}スケールする',
                "{s:0.8}アンチマターステークとそれ以前が適用される{}"
            }
        },
        stake_dckst_nebular = {
            name = "ネビュラーステーク",
            text = {
                '要求スコアが{C:attention}アンティ{}ごとに{C:attention}超高速{}でスケールする',
                "{s:0.8}アンチマターステークとそれ以前が適用される{}"
            }
        },
        stake_dckst_penultimate = {
            name = "ペナルティメイトステーク",
            text = {
                '{C:red}ショップスロット -1{}',
                "{s:0.8}アンチマターステークとそれ以前が適用される{}"
            }
        },
        stake_dckst_ultimate = {
            name = "アルティメットステーク",
            text = {
                '要求スコアが{C:attention}アンティ{}ごとに{C:attention}極めて速く{}スケールする',
                "{s:0.8}ユニバーサルステークとそれ以前が適用される{}"
            }
        }
    },
    Tag = {
        tag_dckst_dexy = {
            name = "デクシータグ",
            text = {
                '無料の',
                '{C:attention}ジャンボデクステリティカルパック{}を開封する',
            }
        },
        tag_dckst_carcana = {
            name = "カルカナタグ",
            text = {
                '無料の',
                '{C:attention}メガカルカナパック{}を開封する',
            }
        },
        tag_dckst_claw = {
            name = "クロウタグ",
            text = {
                '無料の',
                '{C:attention}メガスペクタクロウパック{}を開封する',
            }
        },
        tag_dckst_neo = {
            name = "ネオタグ",
            text = {
                '無料の',
                '{C:attention}メガネオアルカナパック{}を開封する',
            }
        },
        tag_dckst_tramway = {
            name = "トラムウェイタグ",
            text = {
                '無料の',
                '{C:attention}メガトラムパック{}を開封する',
            }
        },
        tag_dckst_phosphy = {
            name = "フォスフィータグ",
            text = {
                "次のベースエディションの",
                "ショップジョーカーが無料になり",
                "{C:dark_edition}フォスフォレセント{}になる",
            }
        },
        tag_dckst_aether = {
            name = "エーテルタグ",
            text = {
                "次のベースエディションの",
                "ショップジョーカーが無料になり",
                "{C:dark_edition}エーテレセント{}になる",
            }
        },
        tag_dckst_prism = {
            name = "プリズムタグ",
            text = {
                "次のベースエディションの",
                "ショップジョーカーが無料になり",
                "{C:dark_edition}プリズマティック{}になる",
            }
        },
        tag_dckst_woody = {
            name = "ウッディタグ",
            text = {
                "次のベースエディションの",
                "ショップジョーカーが無料になり",
                "{C:dark_edition}ウッデン{}になる",
            }
        },
        tag_dckst_sumeable = {
            name = "スメアブルタグ",
            text = {
                "ランダムな消耗カードを",
                "{C:attention}2{}枚スロットに追加する",
                "{C:inactive}（空き不要）{}",
            }
        },
        tag_dckst_top_up_pro_max = {
            name = "トップアップタグ プロマックス",
            text = {
                "最大{C:attention}#1#{}枚の",
                "{C:rare}レア{}ジョーカーを作る、{X:money,C:white}X$#2#{}",
                "{C:inactive}（空きが必要）{}",
            }
        },
        tag_dckst_fixy = {
            name = "フィクシータグ",
            text = {
                'デッキ内のカードを{C:attention}#1#-#2#{}枚',
                '{C:red,E:2}破壊{}する'
            }
        },
        tag_dckst_temporahandy = {
            name = 'テンポラハンディタグ',
            text = {
                "次のラウンドで",
                "{C:blue}+#1#{}一時的なハンドを得る"
            }
        },
        tag_dckst_temporatrashy = {
            name = 'テンポラトラッシータグ',
            text = {
                "次のラウンドで",
                "{C:red}+#1#{}一時的なディスカードを得る"
            }
        },
        tag_dckst_price = {
            name = "プライスタグ",
            text = {
                '次のショップの{C:attention,E:2}すべてのアイテム{}が',
                '{C:attention}#1#%{}オフになる',
            }
        },
        tag_dckst_tag = {
            name = "タグタグ",
            text = {
                'ランダムな',
                '{C:attention}タグ{}を作る',
            }
        },
        tag_dckst_combo = {
            name = "コンボタグ",
            text = {
                '{C:attention}デクシータグ{}、',
                '{C:attention}カルカナタグ{}、{C:attention}ネオタグ{}、',
                '{C:attention}トラムウェイタグ{}を作る',
            }
        },
        tag_dckst_saturn = {
            name = "サターンタグ",
            text = {
                '{C:attention}#1#{}を',
                '{C:attention}#2#{}レベル分',
                'レベルアップする',
            }
        },
        tag_dckst_crazy = {
            name = "クレイジータグ",
            text = {
                '{C:attention}クレイジージョーカー{}を',
                '生成する{C:inactive}（空き不要）{}',
            }
        },
        tag_dckst_sextuple = {
			name = "セクスタプルタグ",
			text = {
				"次に選択した{C:attention}タグ{}の",
				"コピーを{C:attention}#1#{}個与える",
				"{s:0.8,C:attention}コピー系タグ{s:0.8}は除く",
			}
		},
        tag_dckst_septuple = {
			name = "セプタプルタグ",
			text = {
				"次に選択した{C:attention}タグ{}の",
				"コピーを{C:attention}#1#{}個与える",
				"{s:0.8,C:attention}コピー系タグ{s:0.8}は除く",
			}
		},
        tag_dckst_vault = {
            name = 'ヴォルトタグ',
            text = {
                "{C:attention}ジョーカースロット +1{}"
            }
        },
        tag_dckst_h = {
            name = "Hタグ",
            text = {
                'ランダムな',
                '{V:1}Hジョーカー{}を作る',
                '{C:inactive}（空きが必要）{}'
            }
        },
        tag_dckst_redeeming = {
            name = 'リディーミングタグ',
            text = {
                '{C:attention}ランダムな{}バウチャーを',
                '引き換える'
            }
        },
        tag_dckst_lasting = {
            name = 'ラスティングタグ',
            text = {
                "{C:attention}エバーグリーン{}付きの",
                "ランダムな{C:attention}ジョーカー{}を作る"
            }
        },
        tag_dckst_fancy = {
            name = "ファンシータグ",
            text = {
                "デッキの{C:attention}30%{}に",
                "ランダムな{C:enhanced}強化{}が",
                "施される"
            }
        },
        tag_dckst_bastet = {
            name = "バステトのタグ",
            text = {
                "ランダムな{C:attention}所持ジョーカー{}を",
                "複製する",
                "{C:inactive}（空きが必要）{}",
                "{s:0.5}CURSE OF RA :fire:{}"
            }
        },
        tag_dckst_beckoning = {
            name = 'ベコニングタグ',
            text = {
                "所持している{C:money}資金{}を",
                "{C:attention}4倍{}にする"
            }
        },
        tag_dckst_concierge = {
            name = "コンシェルジュタグ",
            text = {
                "次のショップジョーカーは",
                "確実に{C:dark_edition}エディション付き{}になる",
                "{C:inactive}（全エディション等確率）{}"
            }
        },
        tag_dckst_ledger = {
            name = "レジャータグ",
            text = {
                'プレイした{C:blue}ハンド{}ごとに{C:money}$2{}、',
                'ディスカードした{C:red}ディスカード{}ごとに{C:money}$1{}を与える'
            }
        },
        tag_dckst_two = {
            name = "トゥータグ",
            text = {
                '{C:attention}+#1#{}消耗スロット'
            }
        },
    },
    Catarot = {
        c_dckst_meowbo = {
            name = "ミャオボ",
            text = {
                '最後に使用した{V:1}キャタロット{}',
                'カードを作る',
                '{s:0.8,V:1}ミャオボ{s:0.8}は除く',
                '{C:inactive}（空きが必要）{}',
            }
        },
        c_dckst_ragdoll = {
            name = "ラグドール",
            text = {
                '選択した{C:attention}1{}枚の',
                'カードに永久的な{C:chips}+#1#{}',
                'ボーナスチップを与える'
            }
        },
        c_dckst_siamese = {
            name = "シャム",
            text = {
                "{C:attention}#1#{}枚のカードを選択し、",
                "{C:attention}右側#2#{}枚のカードが",
                "{C:attention}一番左{}のカードの",
                "スーツをコピーする",
                "{C:inactive}（ドラッグして並べ替え）{}"
            }
        },
        c_dckst_bengal = {
            name = "ベンガル",
            text = {
                '選択した最大{C:attention}#2#{}枚の',
                'カードを{C:diamonds}ダイヤ{}または',
                '{C:spades}スペード{}のどちらかに',
                '変換する',
                '{C:inactive,s:0.75}（カードごとにランダムに決定）{}'
            }
        },
        c_dckst_russianblue = {
            name = "ロシアンブルー",
            text = {
                '選択した最大{C:attention}#2#{}枚の',
                'カードを{C:hearts}ハート{}または',
                '{C:clubs}クラブ{}のどちらかに',
                '変換する',
                '{C:inactive,s:0.75}（カードごとにランダムに決定）{}'
            }
        },
        c_dckst_abyssinian = {
            name = "アビシニアン",
            text = {
            '所持金を次の',
            '{C:money}$#1#{}の倍数に設定する'
            }
        },
        c_dckst_chartreux = {
            name = "シャルトリュー",
            text = {
                '選択した{C:attention}#1#{}枚のカードに',
                '{C:attention}シャルトルーズシール{}を追加する'
            }
        },
        c_dckst_devonrex = {
            name = "デボンレックス",
            text = {
                '選択した{C:attention}#1#{}枚の',
                'カードを{C:attention}ストライプドカード{}に',
                '強化する'
            }
        },
        c_dckst_norwegianforest = {
            name = "ノルウェージャンフォレストキャット",
            text = {
                '選択した{C:attention}#1#{}枚の',
                'カードを{C:attention}ランダムカード{}に',
                '強化する'
            }
        },
        c_dckst_mainecoon = {
            name = "メインクーン",
            text = {
                '選択した{C:attention}#1#{}枚の',
                'カードを{C:attention}ルブロンドカード{}に',
                '強化する'
            }
        },
        c_dckst_rustyspotted = {
            name = "ラスティスポッテッド",
            text = {
                '選択した最大{C:attention}#1#{}枚の',
                'カードを{C:attention}ネイチャーカード{}に',
                '強化する'
            }
        },
        c_dckst_americanshorthair = {
            name = {"アメリカン", "ショートヘア"},
            text = {
                '選択した{C:attention}#1#{}枚の',
                'カードを{C:attention}スターリーカード{}に',
                '強化する'
            }
        },
        c_dckst_birman = {
            name = "バーマン",
            text = {
                '選択した最大{C:attention}#1#{}枚の',
                'カードを{C:attention}カルト・フランセーズ{}に',
                '強化する'
            }
        },
        c_dckst_grumpy = {
            name = "グランピーキャット",
            text = {
                '選択した{C:attention}#1#{}枚の',
                'カードを{C:attention}テクノカード{}に',
                '強化する'
            }
        },
        c_dckst_munchkins = {
            name = "マンチカン",
            text = {
                '選択した{C:attention}#1#{}枚のカードに',
                '{C:attention}ペリウィンクルシール{}を追加する'
            }
        },
        c_dckst_kinkalow = {
            name = "キンカロー",
            text = {
                '選択した最大{C:attention}#1#{}枚の',
                'カードを{C:attention}オノマトペティックカード{}に',
                '強化する'
            }
        },
        c_dckst_burmese = {
            name = "バーミーズ",
            text = {
                '選択した{C:attention}#1#{}枚のジョーカーに',
                '{C:green}#2#分の#3#{}の確率で',
                '{C:attention}エバーグリーンステッカー{}を',
                '適用する'
            }
        },
        c_dckst_persian = {
            name = "ペルシャ",
            text = {
                '選択した{C:attention}#1#{}枚の',
                'ジョーカーまたはトランプカードに',
                '{C:attention}スマイリーステッカー{}を適用する'
            }
        },
        c_dckst_minuet = {
            name = "メヌエット",
            text = {
                '選択した最大{C:attention}#1#{}枚の',
                'カードを{C:attention}Hカード{}に',
                '強化する'
            }
        },
        c_dckst_europeanshorthair = {
            name = { "ヨーロピアン", "ショートヘア" },
            text = {
                '選択した最大{C:attention}#1#{}枚の',
                'カードを{C:attention}コバルトカード{}に',
                '強化する'
            }
        },
        c_dckst_snowshoe = {
            name = "スノーシュー",
            text = {
                '選択した最大{C:attention}#1#{}枚の',
                'カードを{C:attention}モリブデンカード{}に',
                '強化する'
            }
        },
        c_dckst_turkishangora = {
            name = { "ターキッシュ", "アンゴラ" },
            text = {
                '選択した{C:attention}#1#{}枚の',
                'カードを{C:attention}ギグリングカード{}に',
                '強化する'
            }
        },
    },
    neotarot = {
        c_dckst_individual = {
            name = "INDIVIDUAL.",
            text = {
                '最後に使用した',
                '{V:1}ネオタロット{}カードを作る',
                '{s:0.8,V:1}INDIVIDUAL.{s:0.8}は除く',
                '{C:inactive}（空きが必要）{}'
            }
        },
        c_dckst_childhood = {
            name = "CHILDHOOD.",
            text = {
                "手札にある{C:attention}#1#{}枚の",
                "ランダムなカードを",
                "{C:attention}ネイチャーカード{}に強化する"
            }
        },
        c_dckst_youth = {
            name = "YOUTH.",
            text = {
                "選択した最大{C:attention}#1#{}枚の",
                "カードのランクを",
                "{C:attention}#2#{}上げる"
            }
        },
        c_dckst_maturity = {
            name = "MATURITY.",
            text = {
                "ランダムな{C:common}コモン{}または",
                "{C:uncommon}アンコモン{}ジョーカーの{C:attention}コピー{}を作る",
                "{C:inactive}（空きが必要）{}"
            }
        },
        c_dckst_old_age = {
            name = "OLD AGE.",
            text = {
                "{C:attention}左端#1#{}枚を除く",
                "すべてのカードを",
                "{C:red}破壊{}する、",
                "{X:money,C:white}X$#2#{}"
            }
        },
        c_dckst_morning = {
            name = "MORNING.",
            text = {
                "最大{C:attention}#1#{}枚のランダムな",
                "{C:common}コモン{}ジョーカーを作り、",
                "その後手札からランダムな{C:attention}#2#{}枚の",
                "カードを{C:red}破壊{}する",
                "{C:inactive}（空きが必要）{}"
            }
        },
        c_dckst_afternoon = {
            name = "AFTERNOON.",
            text = {
                "ランダムな{C:attention}ジョーカー{}を作る",
                "{C:inactive}（空き不要）{}"
            }
        },
        c_dckst_evening = {
            name = "EVENING.",
            text = {
                "{X:money,C:white}X$#1#{}、",
                "ランダムな{C:attention}#2#{}枚の",
                "未変更カードを作り",
                "デッキに追加する"
            }
        },
        c_dckst_night = {
            name = "NIGHT.",
            text = {
                "最低{C:attention}#1#{}枚のカードを選択し、",
                "選択した{C:attention}#2#{}枚のランダムな",
                "カードのコピーを{C:attention}#3#{}枚",
                "作る"
            }
        },
        c_dckst_earth_and_air = {
            name = "EARTH AND AIR.",
            text = {
                "手札のカードはそれぞれ",
                "{C:green}#1#分の#2#{}の確率で",
                "{C:attention}ストーンカード{}になり、",
                "{C:green}#3#分の#4#{}の確率で",
                "{C:attention}ホワイトシール{}を受け取る"
            }
        },
        c_dckst_water_and_fire = {
            name = "WATER AND FIRE.",
            text = {
                "選択した{C:attention}#3#{}枚のカードに",
                "永久的な{C:mult}+#1#{}倍率または",
                "{C:chips}+#2#{}チップのボーナスを",
                "適用する"
            }
        },
        c_dckst_dance = {
            name = "DANCE.",
            text = {
                "このランで最後に使用した",
                "{C:tarot}タロット{}または{C:planet}惑星{}カードを",
                "{C:attention}#1#{}枚作る",
                "{s:0.8,C:tarot}愚者{s:0.8}は除く",
            }
        },
        c_dckst_shopping = {
            name = "SHOPPING.",
            text = {
                "ランダムな{C:attention}タグ{}を作る、",
                "{C:money}-$#1#{}"
            }
        },
        c_dckst_open_air = {
            name = "OPEN AIR.",
            text = {
                "最低{C:attention}#1#{}枚のカードを選択",
                "選択したランダムな{C:attention}#2#{}枚の",
                "カードに{C:attention}ホワイトシール{}を適用する"
            }
        },
        c_dckst_visual_arts = {
            name = "VISUAL ARTS.",
            text = {
                "{C:green}#1#分の#2#{}の確率で",
                "選択した{C:attention}#3#{}枚の",
                "カードにランダムな{C:dark_edition}エディション{}を",
                "適用する{C:inactive,s:0.8}（全エディション等確率）{}"
            }
        },
        c_dckst_spring = {
            name = "SPRING.",
            text = {
                '選択した{C:attention}#1#{}枚の',
                'カードを{C:attention}サーペンタインカード{}に強化する'
            }
        },
        c_dckst_summer = {
            name = "SUMMER.",
            text = {
                '選択した最大{C:attention}#2#{}枚のカードから',
                '強化を取り除く、',
                '取り除いた強化1つにつき',
                '{X:money,C:white}X$#1#{}',
            }
        },
        c_dckst_autumn = {
            name = "AUTUMN.",
            text = {
                'ランダムな{C:attention}#2#{}枚のジョーカーに',
                '{C:attention}パリシャブル{}ステッカーを適用する、',
                '{X:money,C:white}X$#1#{}'
            }
        },
        c_dckst_winter = {
            name = "WINTER.",
            text = {
                '選択した最大{C:attention}#1#{}枚の',
                'カードを{C:attention}アイシーカード{}に',
                '強化する'
            }
        },
        c_dckst_the_game = {
            name = "THE GAME.",
            text = {
                '選択した最大{C:attention}#2#{}枚のカードに',
                '永久的な{C:mult}+#1#{}倍率の',
                'ボーナスを適用する',
            }
        },
        c_dckst_collective = {
            name = "COLLECTIVE.",
            text = {
                '最大{C:attention}#1#{}枚の',
                'ランダムな{V:1}ネオタロット{}カードを作る',
                '{C:inactive}（空きが必要）{}'
            }
        },
    },
    Route = {
        c_dckst_route_1 = {
            name = "ルート1",
            text = {
                '手札の{C:attention}すべて{}のカードに',
                '{C:green}#1#分の#2#{}の確率で',
                '{C:attention}アルミニウムカード{}になる',
                '可能性がある',
            }
        },
        c_dckst_route_3 = {
            name = "ルート3",
            text = {
                '手札の{C:attention}すべて{}のカードに',
                '{C:green}#1#分の#2#{}の確率で',
                '{C:mult}+#3#{}倍率のボーナスを',
                '得る可能性がある'
            }
        },
        c_dckst_route_5 = {
            name = "ルート5",
            text = {
                '手札の{C:attention}すべて{}のカードに',
                '{C:green}#1#分の#2#{}の確率で',
                '{C:chips}+#3#{}チップのボーナスを',
                '得る可能性がある'
            }
        },
        c_dckst_route_6 = {
            name = "ルート6",
            text = {
                '{C:attention}すべて{}の所持ジョーカーに',
                '{C:green}#1#分の#2#{}の確率で',
                '{C:attention}エバーグリーン{}ステッカーが',
                '適用される可能性がある'
            }
        },
        c_dckst_route_11 = {
            name = "ルート11",
            text = {
                '手札の{C:attention}すべて{}のカードに',
                '{C:green}#1#分の#2#{}の確率で',
                'ランダムな{C:dark_edition}エディション{}が',
                '適用される可能性がある',
            }
        },
        c_dckst_route_12 = {
            name = "ルート12",
            text = {
                '手札の{C:attention}すべて{}のカードに',
                '{C:green}#1#分の#2#{}の確率で',
                '{C:attention}アイシーカード{}になる',
                '可能性がある'
            }
        },
        c_dckst_route_16 = {
            name = "ルート16",
            text = {
                '手札の{C:attention}すべて{}のカードに',
                '{C:green}#1#分の#2#{}の確率で',
                '{C:attention}ネイチャーカード{}になる',
                '可能性がある'
            }
        },
        c_dckst_route_19 = {
            name = "ルート19",
            text = {
                'ランダムな{C:attention}消耗{}カードを作る',
                '{C:inactive}（空き不要）{}'
            }
        },
        c_dckst_route_30 = {
            name = "ルート30",
            text = {
                'ランダムな{C:uncommon}アンコモン{}ジョーカーを',
                '{C:attention}#1#{}枚作る',
                '{C:inactive}（空きが必要）{}'
            }
        },
        c_dckst_route_35 = {
            name = "ルート35",
            text = {
                '手札の{C:attention}すべて{}のカードに',
                '{C:green}#1#分の#2#{}の確率で',
                'ランダムな{C:attention}メタラージック{}強化を',
                '受ける可能性がある'
            }
        },
        c_dckst_route_48 = {
            name = "ルート48",
            text = {
                '手札の{C:attention}すべて{}のカードに',
                '{C:green}#1#分の#2#{}の確率で',
                'ランダムな{C:attention}シール{}が',
                '適用される可能性がある'
            }
        },
        c_dckst_route_57 = {
            name = "ルート57",
            text = {
                '手札の{C:attention}すべて{}のカードに',
                '{C:green}#1#分の#2#{}の確率で',
                '{X:chips,C:white}+X#3#{}チップのボーナスを',
                '得る可能性がある'
            }
        },
        c_dckst_route_58 = {
            name = "ルート58",
            text = {
                '手札の{C:attention}すべて{}のカードに',
                '{C:green}#1#分の#2#{}の確率で',
                '{X:mult,C:white}+X#3#{}倍率のボーナスを',
                '得る可能性がある'
            }
        },
        c_dckst_route_59 = {
            name = "ルート59",
            text = {
                '手札の{C:attention}すべて{}のカードに',
                '{C:green}#1#分の#2#{}の確率で',
                '{C:attention}サーペンタインカード{}になる',
                '可能性がある'
            }
        },
        c_dckst_route_64 = {
            name = "ルート64",
            text = {
                '手札の{C:attention}すべて{}のカードに',
                '{C:green}#1#分の#2#{}の確率で',
                '{C:attention}テクノカード{}になる',
                '可能性がある'
            }
        },
        c_dckst_route_67 = {
            name = "ルート67",
            text = {
                '{C:attention}すべて{}の所持ジョーカーに',
                '{C:green}#1#分の#2#{}の確率で',
                '{C:dark_edition}ウッデン{}エディションを',
                '受ける可能性がある'
            }
        },
        c_dckst_route_70 = {
            name = "ルート70",
            text = {
                '手札の{C:attention}すべて{}のカードに',
                '{C:green}#1#分の#2#{}の確率で',
                '{C:attention}スマイリー{}ステッカーが',
                '適用される',
                '可能性がある'
            }
        },
        c_dckst_route_72 = {
            name = "ルート72",
            text = {
                'ランダムな{V:1}キャタロット{}と',
                'ランダムな{V:2}ネオタロット{}を作る',
                '{C:inactive}（空きが必要）{}'
            }
        },
        c_dckst_route_75 = {
            name = "ルート75",
            text = {
                'ランダムな{C:common}コモン{}ジョーカーを',
                '{C:attention}#1#{}枚作る',
                '{C:inactive}（空きが必要）{}'
            }
        },
        c_dckst_route_78 = {
            name = "ルート78",
            text = {
                '最後に使用した',
                '{V:1}ルート{}を作る',
                '{s:0.8,V:1}ルート78{s:0.8}は除く',
                '{C:inactive}（空きが必要）{}'
            }
        },
    },
    Spectaclaw = {
        c_dckst_bombay = {
            name = "ボンベイ",
            text = {
                '選択した最大{C:attention}#1#{}枚の',
                'カードを{C:attention}グラスカード{}に強化する、',
                '{C:green}#2#分の#3#{}の確率で',
                '強化されたカードに',
                '{C:attention}レッド{}または{C:attention}ブルーシール{}が付く、',
                '{X:money,C:white}X$#4#{}'
            }
        },
        c_dckst_britishshorthair = {
            name = "ブリティッシュショートヘア",
            text = {
                '選択した最大{C:attention}#1#{}枚の',
                'カードを{C:attention}コンセキュティブカード{}に',
                '強化する、{X:money,C:white}X$#2#{}'
            }
        },
        c_dckst_scottishfold = {
            name = "スコティッシュフォールド",
            text = {
                '{C:attention}ランダム{}な',
                '{C:attention}#1#{}枚のランダムなカードに',
                'ランダムな強化を適用する、{X:money,C:white}X$#2#{}'
            }
        },
        c_dckst_diamondeye = {
            name = "ダイヤモンドアイ",
            text = {
                '手札の{C:attention}すべて{}のカードに',
                '{C:green}#1#分の#2#',
                'の確率で',
                '{C:diamonds}ダイヤ{}または{C:clubs}クラブ{}に',
                '変わる可能性がある、',
                '{X:money,C:white}X$#3#{}'
            }
        },
        c_dckst_mutatedbombay = {
            name = "ミューテイテッドボンベイ",
            text = {
                '{C:attention}#1#{}枚選択すると、',
                '{C:attention}左{}にあるすべてのカードが',
                '永久的な',
                '{X:mult,C:white}+X#2#{}倍率のボーナスを得る、',
                '{X:money,C:white}X$#3#{}'
            }
        },
        c_dckst_ojosazules = {
            name = "オホスアスーレス",
            text = {
                '手札の{C:attention}すべて{}のカードに',
                '{C:green}#1#分の#2#{}の確率で',
                '{C:clubs}クラブ{}に変わる可能性がある、',
                '{X:money,C:white}X$#3#{}'
            }
        },
        c_dckst_americanwirehair = {
            name = "アメリカンワイヤーヘア",
            text = {
                '{C:dark_edition}ネガティブ{}の{V:1}キャタロット{}カードを',
                '{C:attention}#1#{}枚作る、{X:money,C:white}X$#2#{}',
            }
        },
        c_dckst_sokoke = {
            name = "ソコケ",
            text = {
                '選択した{C:attention}#1#{}枚のカードに',
                '{C:dark_edition}コズミック{}を適用する、{X:money,C:white}X$#2#{}'
            }
        },
        c_dckst_bastet = {
            name = "バステト、女神",
            text = {
                'ランダムなジョーカーの',
                '{C:attention}コピー{}を作る、{X:money,C:white}X$#1#{}',
                '{C:inactive}（空き不要）{}',
                '{C:inactive}（コピーから{C:dark_edition}ネガティブ{C:inactive}を取り除く）{}'
            }
        },
        c_dckst_manekineko = {
            name = {"まねきねこ！", "{s:0.6}beckoning cat!{}"},
            text = {
                '手札の{C:attention}すべて{}のカードを',
                '{C:attention}ラッキーカード{}に変換する、',
                '{X:money,C:white}X$#1#{}'
            }
        },
    },
    Voucher = {
        v_dckst_expansionpermit = {
            name = "エクスパンションパーミット",
            text = {
            "ショップに利用可能な",
            "ブースタースロットが{C:attention}+#1#{}"
            }
        },
        v_dckst_prestigepermit = {
            name = "プレステージパーミット",
            text = {
            "ショップに利用可能な",
            "ブースタースロットが{C:attention}+#1#{}"
            }
        },
        v_dckst_extra_digits = {
            name = "エクストラデジッツ",
            text = {
                '{C:attention}カード選択上限 +#1#{}',
                '{C:attention}{C:blue}ハンド +#1#{}'
            }
        },
        v_dckst_ambidextrous = {
            name = "アンビデクストラス",
            text = {
                '{C:attention}カード選択上限 +#1#{}',
                '{C:attention}{C:blue}ハンド +#1#{}'
            }
        },
        v_dckst_expired = {
            name = "期限切れバウチャー",
            text = {
                '{C:inactive}このバウチャーは期限切れです。',
                '{C:inactive}新しいものを引き換えますか？',
            }
        },
        v_dckst_double_downer = {
            name = "ダブルダウナー",
            text = {
                'ショップに利用可能な',
                '{C:attention}バウチャースロット +#1#{}'
            }
        },
        v_dckst_meow = {
            name = "meow!",
            text = {
                    "{V:1}キャタロット{}がショップに{B:1,C:white}2X{}",
                    "頻繁に出現する",
                },
        },
        v_dckst_feliphile = {
            name = "フェリファイル",
            text = {
                    "{V:1}キャタロット{}がショップに{B:1,C:white}4X{}",
                    "頻繁に出現する",
                },
        },
        v_dckst_new_major = {
            name = "ニューメジャー",
            text = {
                    "{V:1}ネオタロット{}がショップに{B:1,C:white}2X{}",
                    "頻繁に出現する",
                },
        },
        v_dckst_beyond_arcana = {
            name = "ビヨンドアルカナ",
            text = {
                    "{V:1}ネオタロット{}がショップに{B:1,C:white}4X{}",
                    "頻繁に出現する",
                },
        },
        v_dckst_double_track = {
            name = "ダブルトラック",
            text = {
                    "{V:1}ルート{}がショップに{B:1,C:white}2X{}",
                    "頻繁に出現する",
                },
        },
        v_dckst_quad_track = {
            name = "クアッドトラック",
            text = {
                    "{V:1}ルート{}がショップに{B:1,C:white}4X{}",
                    "頻繁に出現する",
                },
        },
        v_dckst_tarot_reading = {
            name = "タロットリーディング",
            text = {
                '{C:tarot}アルカナ{}パックには常に',
                '{C:attention}最も使用した{}{C:tarot}タロット{}カードが',
                '含まれる'
            }
        },
        v_dckst_foretold_prophecy = {
            name = "フォアトールドプロフェシー",
            text = {
                '所持しているすべての{C:attention}消耗{}カードが',
                '{X:mult,C:white}X#1#{}倍率を与える'
            }
        },
        v_dckst_money_buddy = {
            name = "マネーバディ",
            text = {
                "報酬支払い時、",
                "{C:money}$#1#{}追加で得る",
            }
        },
        v_dckst_cash_in_guru = {
            name = "キャッシュインGuru",
            text = {
                "報酬支払い時、",
                "{C:money}$#1#{}追加で得る",
            }
        },
        v_dckst_ahod = {
            name = "オールハンズオンデッキ",
            text = {
                '{C:attention}カード選択上限 +#1#{}',
                '{C:attention}{C:blue}ハンド +#1#{}'
            }
        },
        v_dckst_triple_troper = {
            name = "トリプルトローパー",
            text = {
                'ショップに利用可能な',
                '{C:attention}バウチャースロット +#1#{}'
            }
        },
        v_dckst_cat_astrophe = {
            name = "キャット・アストロフィー",
            text = {
                    "{V:1}キャタロット{}がショップに{B:1,C:white}8X{}",
                    "頻繁に出現する",
                },
        },
        v_dckst_neo_madness = {
            name = "ネオマッドネス",
            text = {
                    "{V:1}ネオタロット{}がショップに{B:1,C:white}8X{}",
                    "頻繁に出現する",
                },
        },
        v_dckst_octo_track = {
            name = "オクトトラック",
            text = {
                    "{V:1}ルート{}がショップに{B:1,C:white}8X{}",
                    "頻繁に出現する",
                },
        },
        v_dckst_the_godfather = {
            name = "ザ・ゴッドファーザー",
            text = {
                "報酬支払い時、",
                "{C:money}$#1#{}追加で得る",
            }
        },
    },
    Other = {
        dckst_chartreuse_seal = {
            name = "シャルトルーズシール",
            text = {
                '{X:chips,C:white}X#1#{}チップ、',
                '{X:mult,C:white}X#2#{}倍率',
            }
        },
        dckst_white_seal = {
            name = "ホワイトシール",
            text = {
                "{X:mult,C:white}X#1#{}倍率を与える、",
                "{C:green}#2#分の#3#{}の確率で",
                "代わりに{X:mult,C:white}X#4#{}倍率"
            }
        },
        dckst_cutesy_seal = {
            name = "キューティシール",
            text = {
                '{C:red}ディスカード{}された時',
                '{V:1}キャタロット{}カードを作る'
            }
        },
        dckst_teal_seal = {
            name = "ティールシール",
            text = {
                '{C:red}ディスカード{}された時',
                '{V:1}ネオタロット{}カードを作る'
            }
        },
        dckst_periwinkle_seal = {
            name = "ペリウィンクルシール",
            text = {
                '{C:green}#1#分の#2#{}の確率で',
                '{C:red}ディスカード{}された時',
                '{C:dckst_spectaclaw}スペクタクロウ{}を作る'
            }
        },
        dckst_asterisk_seal = {
            name = "アスタリスクシール",
            text = {
                'このカードを',
                '{C:attention}#1#{}回再発動する'
            }
        },
        dckst_asterism_seal = {
            name = "アスタリズムシール",
            text = {
                'このカードを',
                '{C:attention}#1#{}回再発動する'
            }
        },
        dckst_evergreen = {
            name = "エバーグリーン",
            text = {
                '{C:attention}デバフ{}、',
                '{C:attention}裏返し{}、',
                '{C:attention}破壊{}',
                'されない',
                '{C:inactive}（売却は可能）{}'
            }
        },
        dckst_smiley = {
            name = "スマイリー",
            text = {
                'スコアされたハンドに',
                '{C:attention}フェイスカード{}が含まれる場合',
                '{C:mult}+#1#{}倍率を与える',
            }
        },
        dckst_zoomy = {
            name = "ズーミー",
            text = {
                'ハンドがスコアされる前に',
                'ランダムに{E:2,C:attention}位置を入れ替える{}'
            }
        },
        dckst_deciduous = {
            name = "デシデュアス",
            text = {
                '{C:attention}#1#{}回発動後に',
                '破壊される'
            }
        },
        dckst_halved = {
            name = "ハルブド",
            text = {
                'すべての値が',
                '{C:red,E:2}半分{}になる',
                '{C:inactive}（可能な場合）{}'
            }
        },
        p_dckst_carcana_pack_normal = {
            name = "カルカナパック",
            text = {
                '最大{C:attention}#2#{}枚の',
                '{V:1}キャタロット{}から{C:attention}#1#{}枚を選んで',
                'すぐに使用する'
            }
        },
        p_dckst_carcana_pack_jumbo = {
            name = "ジャンボカルカナパック",
            text = {
                '最大{C:attention}#2#{}枚の',
                '{V:1}キャタロット{}から{C:attention}#1#{}枚を選んで',
                'すぐに使用する'
            }
        },
        p_dckst_carcana_pack_mega = {
            name = "メガカルカナパック",
            text = {
                '最大{C:attention}#2#{}枚の',
                '{V:1}キャタロット{}から{C:attention}#1#{}枚を選んで',
                'すぐに使用する'
            }
        },
        p_dckst_neoarcana_pack_normal = {
            name = "ネオアルカナパック",
            text = {
                '最大{C:attention}#2#{}枚の',
                '{V:1}ネオタロット{}から{C:attention}#1#{}枚を選んで',
                'すぐに使用する'
            }
        },
        p_dckst_neoarcana_pack_jumbo = {
            name = "ジャンボネオアルカナパック",
            text = {
                '最大{C:attention}#2#{}枚の',
                '{V:1}ネオタロット{}から{C:attention}#1#{}枚を選んで',
                'すぐに使用する'
            }
        },
        p_dckst_neoarcana_pack_mega = {
            name = "メガネオアルカナパック",
            text = {
                '最大{C:attention}#2#{}枚の',
                '{V:1}ネオタロット{}から{C:attention}#1#{}枚を選んで',
                'すぐに使用する'
            }
        },
        p_dckst_tram_pack_normal = {
            name = "トラムパック",
            text = {
                '最大{C:attention}#2#{}枚の',
                '{V:1}ルート{}から{C:attention}#1#{}枚を選んで',
                'すぐに使用する'
            }
        },
        p_dckst_tram_pack_jumbo = {
            name = "ジャンボトラムパック",
            text = {
                '最大{C:attention}#2#{}枚の',
                '{V:1}ルート{}から{C:attention}#1#{}枚を選んで',
                'すぐに使用する'
            }
        },
        p_dckst_tram_pack_mega = {
            name = "メガトラムパック",
            text = {
                '最大{C:attention}#2#{}枚の',
                '{V:1}ルート{}から{C:attention}#1#{}枚を選んで',
                'すぐに使用する'
            }
        },
        p_dckst_spectaclaw_pack_normal = {
            name = "スペクタクロウパック",
            text = {
                '最大{C:attention}#2#{}枚の',
                '{C:dckst_spectaclaw}スペクタクロウ{}から{C:attention}#1#{}枚を選んで',
                'すぐに使用する'
            }
        },
        p_dckst_spectaclaw_pack_jumbo = {
            name = "ジャンボスペクタクロウパック",
            text = {
                '最大{C:attention}#2#{}枚の',
                '{C:dckst_spectaclaw}スペクタクロウ{}から{C:attention}#1#{}枚を選んで',
                'すぐに使用する'
            }
        },
        p_dckst_spectaclaw_pack_mega = {
            name = "メガスペクタクロウパック",
            text = {
                '最大{C:attention}#2#{}枚の',
                '{C:dckst_spectaclaw}スペクタクロウ{}から{C:attention}#1#{}枚を選んで',
                'すぐに使用する'
            }
        },
        p_dckst_decksteritical_pack_normal = {
            name = "デクステリティカルパック",
            text = {
                '最大{C:attention}2{}枚の',
                '{X:black,V:1}decksterity.{}ジョーカーから',
                '{C:attention}1{}枚を選ぶ',
                }
        },
        p_dckst_decksteritical_pack_jumbo = {
            name = "ジャンボデクステリティカルパック",
            text = {
                '最大{C:attention}4{}枚の',
                '{X:black,V:1}decksterity.{}ジョーカーから',
                '{C:attention}1{}枚を選ぶ',
                }
        },
        p_dckst_decksteritical_pack_mega = {
            name = "メガデクステリティカルパック",
            text = {
                '最大{C:attention}4{}枚の',
                '{X:black,V:1}decksterity.{}ジョーカーから',
                '{C:attention}2{}枚を選ぶ',
                }
        },
        dckst_dandy_sticker = { name = "ダンディステッカー", text = { "このジョーカーで", "{C:attention}ダンディ", "{C:attention}ステーク{}難易度に勝利した", } },
        dckst_feline_sticker = { name = "フィラインステッカー", text = { "このジョーカーで", "{C:attention}フィライン", "{C:attention}ステーク{}難易度に勝利した", } },
        dckst_chroma_sticker = { name = "クロマステッカー", text = { "このジョーカーで", "{C:attention}クロマ", "{C:attention}ステーク{}難易度に勝利した", } },
        dckst_clay_sticker = { name = "クレイステッカー", text = { "このジョーカーで", "{C:attention}クレイ", "{C:attention}ステーク{}難易度に勝利した", } },
        dckst_storm_sticker = { name = "ストームステッカー", text = { "このジョーカーで", "{C:attention}ストーム", "{C:attention}ステーク{}難易度に勝利した", } },
        dckst_fall_sticker = { name = "フォールステッカー", text = { "このジョーカーで", "{C:attention}フォール", "{C:attention}ステーク{}難易度に勝利した", } },
        dckst_cuprum_sticker = { name = "キュプラムステッカー", text = { "このジョーカーで", "{C:attention}キュプラム", "{C:attention}ステーク{}難易度に勝利した", } },
        dckst_silver_sticker = { name = "シルバーステッカー", text = { "このジョーカーで", "{C:attention}シルバー", "{C:attention}ステーク{}難易度に勝利した", } },
        dckst_hollow_sticker = { name = "ホロウステッカー", text = { "このジョーカーで", "{C:attention}ホロウ", "{C:attention}ステーク{}難易度に勝利した", } },
        dckst_solar_sticker = { name = "ソーラーステッカー", text = { "このジョーカーで", "{C:attention}ソーラー", "{C:attention}ステーク{}難易度に勝利した", } },
        dckst_lunar_sticker = { name = "ルナーステッカー", text = { "このジョーカーで", "{C:attention}ルナー", "{C:attention}ステーク{}難易度に勝利した", } },
        dckst_satellite_sticker = { name = "サテライトステッカー", text = { "このジョーカーで", "{C:attention}サテライト", "{C:attention}ステーク{}難易度に勝利した", } },
        dckst_platina_sticker = { name = "プラティナステッカー", text = { "このジョーカーで", "{C:attention}プラティナ", "{C:attention}ステーク{}難易度に勝利した", } },
        dckst_bismuth_sticker = { name = "ビスマスステッカー", text = { "このジョーカーで", "{C:attention}ビスマス", "{C:attention}ステーク{}難易度に勝利した", } },
        dckst_h_sticker = { name = "Hステッカー", text = { "このジョーカーで", "{C:attention}H", "{C:attention}ステーク{}難易度に勝利した", } },
        dckst_atomic_sticker = { name = "アトミックステッカー", text = { "このジョーカーで", "{C:attention}アトミック", "{C:attention}ステーク{}難易度に勝利した", } },
        dckst_antimatter_sticker = { name = "アンチマターステッカー", text = { "このジョーカーで", "{C:attention}アンチマター", "{C:attention}ステーク{}難易度に勝利した", } },
        dckst_shattered_sticker = { name = "シャッタードステッカー", text = { "このジョーカーで", "{C:attention}シャッタード", "{C:attention}ステーク{}難易度に勝利した", } },
        dckst_exalted_sticker = { name = "イグザルテッドステッカー", text = { "このジョーカーで", "{C:attention}イグザルテッド", "{C:attention}ステーク{}難易度に勝利した", } },
        dckst_continual_sticker = { name = "コンティニュアルステッカー", text = { "このジョーカーで", "{C:attention}コンティニュアル", "{C:attention}ステーク{}難易度に勝利した", } },
        dckst_universal_sticker = { name = "ユニバーサルステッカー", text = { "このジョーカーで", "{C:attention}ユニバーサル", "{C:attention}ステーク{}難易度に勝利した", } },
        dckst_nebular_sticker = { name = "ネビュラーステッカー", text = { "このジョーカーで", "{C:attention}ネビュラー", "{C:attention}ステーク{}難易度に勝利した", } },
        dckst_penultimate_sticker = { name = "ペナルティメイトステッカー", text = { "このジョーカーで", "{C:attention}ペナルティメイト", "{C:attention}ステーク{}難易度に勝利した", } },
        dckst_ultimate_sticker = { name = "アルティメットステッカー", text = { "このジョーカーで", "{C:attention}アルティメット", "{C:attention}ステーク{}難易度に勝利した", } },
        undiscovered_catarot = { 
                name = "未発見 :3",
                text = { "シードされていない", "ランでこのカードを", "購入または使用すると", "効果を知ることができる", },
        },
        undiscovered_neotarot = { 
                name = "未発見.",
                text = { "シードされていない", "ランでこのカードを", "購入または使用すると", "効果を知ることができる", },
        },
        undiscovered_spectaclaw = {
            name = "未発見!~",
            text = { "シードされていない", "ランでこのカードを", "購入または使用すると", "効果を知ることができる", }
        },
        undiscovered_route = {
            name = "未使用のルート",
            text = { "シードされていない", "ランでこのルートを", "購入または使用すると", "効果を知ることができる", }
        }
    },
},

misc = {
        dictionary = {
            b_catarot_cards = "キャタロットカード",
            b_neotarot_cards = "ネオタロットカード",
            b_spectaclaw_cards = "スペクタクロウカード",
            b_route_cards = "ルート",

            k_catarot = "キャタロット",
            k_neotarot = "ネオタロット",
            k_spectaclaw = "スペクタクロウ",
            k_route = "ルート",

            k_dckst_carcana_pack = "カルカナパック",
            k_dckst_carcana_pack_jumbo = "ジャンボカルカナパック",
            k_dckst_carcana_pack_mega = "メガカルカナパック",
            
            k_dckst_neoarcana_pack = "ネオアルカナパック",
            k_dckst_neoarcana_pack_jumbo = "ジャンボネオアルカナパック",
            k_dckst_neoarcana_pack_mega = "メガネオアルカナパック",

            k_dckst_spectaclaw_pack = "スペクタクロウパック",
            k_dckst_spectaclaw_pack_jumbo = "ジャンボスペクタクロウパック",
            k_dckst_spectaclaw_pack_mega = "メガスペクタクロウパック",

            k_dckst_tram_pack = "トラムパック",
            k_dckst_tram_pack_jumbo = "ジャンボトラムパック",
            k_dckst_tram_pack_mega = "メガトラムパック",

            k_dckst_decksteritical_pack = "デクステリティカルパック",
            k_dckst_decksteritical_pack_jumbo = "ジャンボデクステリティカルパック",
            k_dckst_decksteritical_pack_mega = "メガデクステリティカルパック",

            k_dckst_loadeddice = "命中！",
            k_dckst_swapped = "スワップ！",
            k_dckst_extruded = "エクストルード！",
            k_dckst_pencil = "ペンシル！",
            k_dckst_coffee_mug = "抽出！",
            k_dckst_superstar = "スーパー！",
            k_dckst_oops = "おっと。",
            k_dckst_shoreline = "ショアライン！",
            k_dckst_ding = "チーン！",
            k_dckst_altitude = "高度！",
            k_dckst_crash = "AAAAAAAAAAAAAAAAA",
            k_dckst_suit_changed = "スーツ変更！",
            k_dckst_sacrifice = "生贄！",
            k_dckst_appraisal = "査定！",
            k_dckst_laugh = "BWAHAHHAHHHAHAH",
            k_dckst_son = "Son！",
            k_dckst_alchemist = "錬金術師！",
            k_dckst_airball = "エアボール！",
            k_dckst_shootagain = "もう一度シュート！",
            k_dckst_coinjar_save = "貯蓄！",
            k_dckst_coinjar_dump = "換金中！",
            k_dckst_cupboard_reset = "リセット！",
            k_dckst_mikal = "ミカル・ブリッジス！",
            k_dckst_naturalized = "自然化！",
            k_dckst_slither = "スリザー！",
            k_dckst_techno_upgrade = "アップグレード.",
            k_dckst_melted = "溶けた！",
            k_dckst_cerium = "セリウム！",
            k_dckst_meow = "meow :3",
            k_dckst_card_added = "カード追加！",
            k_dckst_storm_stake_warning = "ハンドには同じランクのカードが2枚以上必要！",
            k_dckst_solar_flare = "太陽フレア！",
            k_dckst_cards_removed = "カード除去！",
            k_dckst_exalted = "イグザルテッドの供物！",
            k_dckst_consecutive_debuff = "このハンドにはストレートが含まれていません！",
            k_dckst_hot = "熱い！",
            k_dckst_cold = "寒い！",
            k_dckst_chips = "チップ",
            k_dckst_destroyed = "破壊された！",
            k_dckst_detonated = "爆発した！",
            k_dckst_fuke = "Fuke！",

            k_dckst_money_buddy = "マネーバディ",
            k_dckst_cash_in_guru = "キャッシュインGuru",
            k_dckst_the_godfather = "ザ・ゴッドファーザー",

            k_dckst_gameset_humble      = "ハンブル",
            k_dckst_gameset_humble_desc = "始めたばかりの初心者プレイヤー向け。",

            k_dckst_gameset_honed       = "ホーンド",
            k_dckst_gameset_honed_desc  = "経験豊富なプレイヤー向け。標準的な体験。",

            k_dckst_gameset_hazardous   = "ハザーダス",
            k_dckst_gameset_hazardous_desc = "自分のマシンを壊したいプレイヤー向け。",

            k_dckst_exquisite = 'エクスクイジット',
            k_dckst_mediumrare = 'ミディアムレア',
            k_dckst_medium = 'ミディアム',
            k_dckst_mediumwell = 'ミディアムウェル',
            k_dckst_welldone = 'ウェルダン',
        },
        labels = {
            dckst_chartreuse_seal = "シャルトルーズシール",
            dckst_white_seal = "ホワイトシール",
            dckst_cutesy_seal = "キューティシール",
            dckst_teal_seal = "ティールシール",
            dckst_periwinkle_seal = "ペリウィンクルシール",
            dckst_asterisk_seal = "アスタリスクシール",
            dckst_asterism_seal = "アスタリズムシール",

            dckst_evergreen = "エバーグリーン",
            dckst_smiley = "スマイリー",
            dckst_zoomy = "ズーミー",
            dckst_deciduous = "デシデュアス",
            dckst_halved = "ハルブド",

            dckst_cosmic = "コズミック",
            dckst_phosphorescent = "フォスフォレセント",
            dckst_aetherescent = "エーテレセント",
            dckst_iridescent = "イリデセント",
            dckst_prismatic = "プリズマティック",
            dckst_wooden = "ウッデン",

            k_dckst_exquisite = 'エクスクイジット',
            k_dckst_mediumrare = 'ミディアムレア',
            k_dckst_medium = 'ミディアム',
            k_dckst_mediumwell = 'ミディアムウェル',
            k_dckst_welldone = 'ウェルダン',
        },
        poker_hands = {
            ["dckst_two_three"] = "ダブルスリー",
            ["dckst_triangle"] = "トライアングル",
            ["dckst_umbra"] = "アンブラ",
            ["dckst_antumbra"] = "アントンブラ",
            ["dckst_bipolar_flush"] = "バイポーラフラッシュ",
            ["dckst_alterostraight"] = "オルテロストレート",
        },
        poker_hand_descriptions = {
            ["dckst_two_three"] = { "同じスーツのカード3枚と", "同じランクのカード3枚" },
            ["dckst_triangle"] = { '10より大きい三角数になる', 'カードランクの合計を持つ3枚以上のカード', '（エースは1、フェイスカードは10として計算）' },
            ["dckst_umbra"] = { "フェイスカード4枚とフェイスでないカード1枚", },
            ["dckst_antumbra"] = { "フェイスでないカード4枚とフェイスカード1枚", },
            ["dckst_bipolar_flush"] = { "1つの色のカードがちょうど3枚、", "もう1つの色のカードが2枚含まれる5枚のハンド" },
            ["dckst_alterostraight"] = { "赤と黒のカードの色が厳密に交互になる", "5枚のストレート" },
        },
        ranks = {
            ["dckst_20"] = "20",
        },
        quips = {
            dckst_fiesta_1_win = {
                'ウェンビーみたいに',
                'プレーオフでキレてるな!'
            },
            dckst_fiesta_1_loss = {
                'ケビン・ハートの方が',
                'まだ健闘してただろ...'
            },
            dckst_fiesta_2_win = {
                'フィエスタ全開、',
                'スパーズが勝利!'
            },
            dckst_fiesta_2_loss = {
                'リーグ一綺麗なユニで',
                '負けるとか正気か'
            },
            dckst_fiesta_3_win = {
                'ウェンビー絶好調で',
                '服も決まってる!'
            },
            dckst_fiesta_3_loss = {
                'ユニ着ないなら',
                '買う意味ないだろ'
            },
            dckst_fiesta_4_win = {
                'これぞフィエスタ',
                'の勝利、間違いない!'
            },
            dckst_fiesta_4_loss = {
                'ポポヴィッチなら',
                'ベンチ行きだぞそれ'
            },
            dckst_fiesta_5_win = {
                'このドリップと勝利、',
                '見た?'
            },
            dckst_fiesta_5_loss = {
                'シティエディションで',
                '負けるとか大変だな'
            },
            dckst_fiesta_6_win = {
                'スパーズが実績を、',
                'フィエスタが手柄を持ってく'
            },
            dckst_fiesta_6_loss = {
                'いや、ユニが全部',
                '仕事してただけだろ'
            },
            dckst_fiesta_7_win = {
                'このフィットは今日',
                '負けてなかった'
            },
            dckst_fiesta_7_loss = {
                'フィエスタは終わり、',
                'お前もな'
            },
            dckst_fiesta_8_win = {
                'ユニのグラフィックより',
                '熱く決まってる'
            },
            dckst_fiesta_8_loss = {
                'ウェンビーでも',
                'これは救えない'
            },
            dckst_fiesta_9_win = {
                'パレードの予約しとけ、',
                'フィエスタが勝った'
            },
            dckst_fiesta_9_loss = {
                'フルカラーの',
                '敗北だな、これは'
            },
            dckst_fiesta_10_win = {
                'スパーズの街、',
                'スパーズの勝利、議論の余地なし'
            },
            dckst_fiesta_10_loss = {
                'フィエスタは弾けてる,',
                'お前のランは弾けてない'
            },
            dckst_jimmy_1_win = {
                '見たか?これぞ',
                '法廷術だぜ、ベイビー!'
            },
            dckst_jimmy_1_loss = {
                '異議あり!...俺が',
                'ここにいることに'
            },
            dckst_jimmy_2_win = {
                'まあいいさ、これは',
                '勝ちってことにしとこう'
            },
            dckst_jimmy_2_loss = {
                'これは負けじゃない、',
                '「和解」ってやつだ'
            },
            dckst_jimmy_3_win = {
                '陪審員の皆さん、',
                '弁護側は以上です。無敗。'
            },
            dckst_jimmy_3_loss = {
                'もっとデカいバス停の',
                'ベンチが必要だな'
            },
            dckst_jimmy_4_win = {
                '正義だ!まあ、',
                '誰が数えてるかは知らんが'
            },
            dckst_jimmy_4_loss = {
                'だから無償弁護は',
                'やらないんだよ'
            },
            dckst_jimmy_5_win = {
                'スリッピン・ジミー再び、',
                '目撃者なし!'
            },
            dckst_jimmy_5_loss = {
                'これを直せる奴を',
                '一人知ってる...たぶん'
            },
            dckst_prismatic_1_win = {
                'どの色も違う輝きで',
                '決まるもんだな'
            },
            dckst_prismatic_1_loss = {
                '輝きなし、煌めきなし、',
                'マルチもなし'
            },
            dckst_prismatic_2_win = {
                'スペクトル全体に',
                '屈折した勝利'
            },
            dckst_prismatic_2_loss = {
                '普通のカード、',
                '普通の結果。驚きだね、本当に'
            },
            dckst_prismatic_3_win = {
                '光を掴め、',
                'マルチを掴め!'
            },
            dckst_prismatic_3_loss = {
                '次はエディション',
                '持ってきてくれ、頼むよ'
            },
            dckst_prismatic_4_win = {
                'これぞフルプリズムの',
                '勝利だ'
            },
            dckst_prismatic_4_loss = {
                'ゼロの輝きは',
                'ゼロの驚き、当然だ'
            },
            dckst_prismatic_5_win = {
                'まばゆい。まさに',
                'まばゆいパフォーマンス'
            },
            dckst_prismatic_5_loss = {
                '地味なカードは',
                '地味な負けを生む'
            },
            dckst_swapped_1_win = {
                'スートを入れ替えて、',
                '運も入れ替えろ!'
            },
            dckst_swapped_1_loss = {
                '今回は交換の',
                '間違った側だったな'
            },
            dckst_swapped_2_win = {
                'ハートがクラブに、',
                '負けが勝ちに!'
            },
            dckst_swapped_2_loss = {
                'スートは全部変わったのに、',
                '負けはそのまま'
            },
            dckst_swapped_3_win = {
                '見た目通りじゃない、',
                'そして勝った!'
            },
            dckst_swapped_3_loss = {
                'スートは変わったが、',
                '結果は変わらず'
            },
            dckst_swapped_4_win = {
                'ダイヤも名前を変えれば',
                'それでも勝つ'
            },
            dckst_swapped_4_loss = {
                'デッキをシャッフルして、',
                'まっすぐ負けにシャッフル'
            },
            dckst_swapped_5_win = {
                'スート変わって、気分も',
                '上がって、ランは勝ち!'
            },
            dckst_swapped_5_loss = {
                '一対一の交換で、',
                'それでも負けたか'
            },
            dckst_stop_sign_1_win = {
                '待って、まだ',
                'いるの?でも良い勝利だな'
            },
            dckst_stop_sign_1_loss = {
                'これのために',
                '自己犠牲したのか?'
            },
            dckst_stop_sign_2_win = {
                '見る前に消えたけど',
                'おめでとう'
            },
            dckst_stop_sign_2_loss = {
                '無駄死にだった',
                'みたいだな'
            },
            dckst_stop_sign_3_win = {
                'もういないけど',
                '雰囲気は良いね'
            },
            dckst_stop_sign_3_loss = {
                '残ってこっちを',
                'ブロックすべきだったな'
            },
            dckst_stop_sign_4_win = {
                '自爆したのに',
                'まだ関係あるみたいだ'
            },
            dckst_stop_sign_4_loss = {
                '完全に無駄に',
                '命を捧げたわけだ'
            },
            dckst_stop_sign_5_win = {
                '幽霊ジョーカーより報告:',
                'ナイスゲーム!'
            },
            dckst_stop_sign_5_loss = {
                'これも止められたら',
                '良かったのに'
            },
            dckst_stop_sign_6_win = {
                'スロットすらないのに',
                '誇りに思う'
            },
            dckst_stop_sign_6_loss = {
                '標識読めよ、',
                '明らかに。ストップ標識だぞ'
            },
            dckst_stop_sign_7_win = {
                '無敗で引退、',
                '技術的にはな'
            },
            dckst_stop_sign_7_loss = {
                '仕事は一つだけ。俺には',
                '一つ仕事があった。そしてやった。',
                'なのにこうなった'
            },
            dckst_extruded_1_win = {
                '売られて、壊されて、',
                'それでも上回った!'
            },
            dckst_extruded_1_loss = {
                'このランには',
                '犠牲が足りなかった'
            },
            dckst_extruded_2_win = {
                'カオスを糧に、',
                '勝利で繁栄する'
            },
            dckst_extruded_2_loss = {
                'もっと売っとけば',
                '良かったのに'
            },
            dckst_extruded_3_win = {
                '全部壊されて',
                'お前は強くなった!'
            },
            dckst_extruded_3_loss = {
                'X1マルチと',
                'それに見合う負け'
            },
            dckst_extruded_4_win = {
                '押し出されても',
                '無敗、ベイビー'
            },
            dckst_extruded_4_loss = {
                'ほんの少し伸びただけ、',
                'それが見え見えだ'
            },
            dckst_extruded_5_win = {
                'どの売却も',
                '価値があった、明らかに'
            },
            dckst_extruded_5_loss = {
                'これには十分な',
                '犠牲がなかった'
            },
            dckst_extruded_6_win = {
                'マルチを絞り出せ、',
                '勝利を絞り出せ!'
            },
            dckst_extruded_6_loss = {
                'それは平坦な',
                '押し出しの負けだな'
            },
            dckst_extruded_7_win = {
                '破壊がこんなに',
                '美しく見えたことはない'
            },
            dckst_extruded_7_loss = {
                '全部残したのに',
                'それでも負けたのか'
            },
            dckst_extruded_8_win = {
                'そのマルチは負けより',
                '強く積み上がった'
            },
            dckst_extruded_8_loss = {
                '何も売らず、',
                '何も得なかった'
            },
            dckst_extruded_9_win = {
                '壊せ、売れ、',
                'それで勝て!'
            },
            dckst_extruded_9_loss = {
                'X1のままだ、',
                '負けもそのまま'
            },
            dckst_extruded_10_win = {
                'UN4YAのお気に入り、',
                'それが見える、大勝利'
            },
            dckst_extruded_10_loss = {
                'ファンのお気に入りでも',
                '時にはむせるもんだ'
            },
            dckst_pencil_1_win = {
                '削られて勝利を',
                '書き上げた!'
            },
            dckst_pencil_1_loss = {
                '何も強化するの',
                '忘れたのか?'
            },
            dckst_pencil_2_win = {
                'どの強化も',
                'これに貢献した'
            },
            dckst_pencil_2_loss = {
                'まだデフォルトの',
                'カード使ってるみたいだな'
            },
            dckst_pencil_3_win = {
                'ナンバー2の鉛筆、',
                'ナンバー1の結果'
            },
            dckst_pencil_3_loss = {
                'ゼロチップ、ゼロ',
                '強化、ゼロの驚き'
            },
            dckst_pencil_4_win = {
                'その勝利を油性マーカーで',
                '書き記した'
            },
            dckst_pencil_4_loss = {
                '消しゴムの方が',
                '俺より働いたな'
            },
            dckst_pencil_5_win = {
                '強化されたカード、',
                '強化された結果!'
            },
            dckst_pencil_5_loss = {
                '白紙のページ、白紙の',
                'チップ、白紙の勝利'
            },
            dckst_coffee_mug_1_win = {
                'カフェインとバイブスで',
                '走った、それでも勝った!'
            },
            dckst_coffee_mug_1_loss = {
                'コーヒーが切れて',
                '勝利も切れた'
            },
            dckst_coffee_mug_2_win = {
                '最初のハンドが違って',
                '当たった、それが分かった'
            },
            dckst_coffee_mug_2_loss = {
                'カフェイン抜きの',
                'パフォーマンスだったな、正直'
            },
            dckst_coffee_mug_3_win = {
                '三口すすって、',
                '一つの大きな勝利'
            },
            dckst_coffee_mug_3_loss = {
                'ハンドサイズより',
                '激しくクラッシュした'
            },
            dckst_coffee_mug_4_win = {
                '早めにピークを迎え、',
                'ずっとトップをキープ'
            },
            dckst_coffee_mug_4_loss = {
                'カフェインが切れると',
                'こうなるってわけだ'
            },
            dckst_coffee_mug_5_win = {
                'マグは空だけど',
                'ランはまだアツい'
            },
            dckst_coffee_mug_5_loss = {
                '肝心な時に',
                '冷めちまった'
            },
            dckst_lilmaxey_1_win = {
                'ンニャー!ンニャ ンニャ!',
                'ンミャー~!'
            },
            dckst_lilmaxey_1_loss = {
                'ンニャ...ンー...',
                'んる。'
            },
            dckst_lilmaxey_2_win = {
                'ンミャー!ンップ!',
                'ンニャ ンニャ ンニャ!'
            },
            dckst_lilmaxey_2_loss = {
                'ンー...ンにゃ?',
                'んる...'
            },
            dckst_lilmaxey_3_win = {
                'ンップ ンップ!',
                'ニャー!!'
            },
            dckst_lilmaxey_3_loss = {
                'んにゃー。',
                '...んー。'
            },
            dckst_lilmaxey_4_win = {
                'ニャー ニャー',
                'ニャー!!'
            },
            dckst_lilmaxey_4_loss = {
                'ンニャ...',
                'んっぷ。'
            },
            dckst_lilmaxey_5_win = {
                'ンニャー! ゴロゴロ~',
                'ンミャー!'
            },
            dckst_lilmaxey_5_loss = {
                'ンー。んる。',
                '...'
            },
            dckst_lilmaxey_6_win = {
                'ンプ! ンプ! ンプ!',
                'ンミャー!!'
            },
            dckst_lilmaxey_6_loss = {
                'ンにゃー...',
                'ンー ンー。'
            },
            dckst_lilmaxey_7_win = {
                'ンミャー! ンニャ',
                'ンニャ ンニャ!'
            },
            dckst_lilmaxey_7_loss = {
                'んる。 ンニャ。',
                'ンー...'
            },
            dckst_lilmaxey_8_win = {
                'ンップ ンにゃー!',
                'ニャー ニャー!!'
            },
            dckst_lilmaxey_8_loss = {
                '...ンにゃ。',
                'んる んる。'
            },
            dckst_lilmaxey_9_win = {
                'ンミャー!! ゴロゴロ',
                'ンニャ ンニャ~'
            },
            dckst_lilmaxey_9_loss = {
                'ンー ンー...',
                'ンにゃー。'
            },
            dckst_lilmaxey_10_win = {
                'ンプ ンプ ンプ',
                'ンミャー!!'
            },
            dckst_lilmaxey_10_loss = {
                'んる...',
                '...ンー。'
            },
            dckst_lilmaxey_11_win = {
                'ンニャ! ンップ!',
                'ゴロゴロにゃー~'
            },
            dckst_lilmaxey_11_loss = {
                'ンにゃー ンにゃー...',
                'んる。'
            },
            dckst_lilmaxey_12_win = {
                'ンミャー ンニャ',
                'ンプ!!'
            },
            dckst_lilmaxey_12_loss = {
                'ンー...',
                'んっぷ んる。'
            },
            dckst_lilmaxey_13_win = {
                'ンップ! ンミャー!',
                'ンニャ ンニャ!!'
            },
            dckst_lilmaxey_13_loss = {
                '...ンにゃ。',
                'ンー。'
            },
            dckst_lilmaxey_14_win = {
                'ゴロゴロ ンニャ',
                'ンミャー!!'
            },
            dckst_lilmaxey_14_loss = {
                'んる んる...',
                'ンにゃー。'
            },
            dckst_lilmaxey_15_win = {
                'ンプ ンプ ンプ!',
                'ンにゃー!'
            },
            dckst_lilmaxey_15_loss = {
                'ンー...',
                '...んる。'
            },
            dckst_lilmaxey_16_win = {
                'ンミャー! ンップ',
                'ンップ ンップ!!'
            },
            dckst_lilmaxey_16_loss = {
                'ンにゃー。 ンー。',
                '...'
            },
            dckst_lilmaxey_17_win = {
                'ンニャ ンニャ!',
                'ゴロゴロにゃー ンミャー~'
            },
            dckst_lilmaxey_17_loss = {
                'んる...',
                'ンニャ ンニャ。'
            },
            dckst_lilmaxey_18_win = {
                'ンプ! ンミャー!',
                'ンプ ンプ!!'
            },
            dckst_lilmaxey_18_loss = {
                '...ンにゃー。',
                'ンー ンー。'
            },
            dckst_lilmaxey_19_win = {
                'ンミャー ンニャ',
                'ンニャ ンミャー!!'
            },
            dckst_lilmaxey_19_loss = {
                'ンー。んる。',
                'ンにゃー...'
            },
            dckst_lilmaxey_20_win = {
                'ンにゃー!! ゴロゴロ',
                'ンプ ンプ ンプ!!'
            },
            dckst_lilmaxey_20_loss = {
                '...んにゃー。',
                '...ンー。'
            },
            dckst_tamerlane_1_win = {
                '帝国は征服の上に',
                '築かれる。よくやった。'
            },
            dckst_tamerlane_1_loss = {
                '征服者でも倒れる。',
                '再び立ち上がれ。'
            },
            dckst_tamerlane_2_win = {
                'すべてのスートが',
                '我が意に屈した。勝利だ。'
            },
            dckst_tamerlane_2_loss = {
                '一度の敗北など',
                '帝国には何でもない。'
            },
            dckst_tamerlane_3_win = {
                '我に逆らう者で',
                '変えられずに去る者はいない。'
            },
            dckst_tamerlane_3_loss = {
                '今回は征服が',
                '足りなかった。'
            },
            dckst_tamerlane_4_win = {
                '草原からスコアボードまで。',
                '無敗だ。'
            },
            dckst_tamerlane_4_loss = {
                'ただの後退だ、',
                'それだけ。進軍は続く。'
            },
            dckst_tamerlane_5_win = {
                'X0.9ずつ、',
                'マルチの帝国を築く。'
            },
            dckst_tamerlane_5_loss = {
                '倒れたスートが少なすぎた。',
                '奪ったものが少なすぎた。'
            },
            dckst_superstar_1_win = {
                '倒したブラインド一つ一つが',
                '伝説に加わる'
            },
            dckst_superstar_1_loss = {
                '最高の者でも',
                'たまには一つ落とす'
            },
            dckst_superstar_2_win = {
                'マルチも積み、リングも積み、',
                '勝利も積む'
            },
            dckst_superstar_2_loss = {
                'そのカムバックには',
                'ブラインドの撃破が足りなかった'
            },
            dckst_superstar_3_win = {
                'それはハイライト級の',
                'フィニッシュだな'
            },
            dckst_superstar_3_loss = {
                '王様でも時には',
                '謙虚にさせられる'
            },
            dckst_superstar_4_win = {
                '偉大さを追い求め、',
                '勝利を掴む'
            },
            dckst_superstar_4_loss = {
                '不調な夜。伝説にも',
                'そういう時はある'
            },
            dckst_superstar_5_win = {
                '倒したブラインド一つ一つが',
                '掲げられた旗だ'
            },
            dckst_superstar_5_loss = {
                'このランじゃない。',
                '今回じゃない'
            },
            dckst_superstar_6_win = {
                'ブラインドごとに+7マルチ、',
                'それが見て取れる'
            },
            dckst_superstar_6_loss = {
                '星が少し早く',
                '暗くなった'
            },
            dckst_superstar_7_win = {
                'ラン全体にダンクを',
                '決めた、間違いなく'
            },
            dckst_superstar_7_loss = {
                '偉大さにも敗北は',
                'あるようだな'
            },
            dckst_cyanotype_1_win = {
                'コピーを作って、',
                '勝利を倍にした'
            },
            dckst_cyanotype_1_loss = {
                '五ハンドかけても',
                '勝利をコピーできなかった'
            },
            dckst_cyanotype_2_win = {
                '設計図完成、',
                '勝利印刷済み'
            },
            dckst_cyanotype_2_loss = {
                'コピーは今回',
                '役に立たなかった'
            },
            dckst_cyanotype_3_win = {
                '勝利にちょうど間に合って',
                '現像できた'
            },
            dckst_cyanotype_3_loss = {
                'ランを救う前に',
                '色褪せてしまった'
            },
            dckst_cyanotype_4_win = {
                '一つのジョーカーが',
                '二つになって、両方勝った'
            },
            dckst_cyanotype_4_loss = {
                '今回は間違った',
                'エネルギーをコピーした'
            },
            dckst_cyanotype_5_win = {
                '印刷して、自爆して、',
                'チャンピオンとして去れ'
            },
            dckst_cyanotype_5_loss = {
                '残念ながら敗北も',
                '複製してしまった'
            },
            dckst_knicks_1_win = {
                'MSGが今まさに',
                '大爆発してる!!'
            },
            dckst_knicks_1_loss = {
                '爆発した。もちろん',
                '爆発したよな。'
            },
            dckst_knicks_2_win = {
                '確率を三倍にして、',
                '街全体を巻き込んだ'
            },
            dckst_knicks_2_loss = {
                '8分の1が当たった。',
                'なぜかいつも8分の1だ'
            },
            dckst_knicks_3_win = {
                'ニューヨークは今夜',
                '眠らない'
            },
            dckst_knicks_3_loss = {
                '全部賭けて、',
                '街が悲しんでいる'
            },
            dckst_knicks_4_win = {
                '確率も三倍、カオスも',
                '倍増、俺たちの勝ちだ!'
            },
            dckst_knicks_4_loss = {
                '予定通り爆発した、',
                '残念だが'
            },
            dckst_knicks_5_win = {
                '2026年はこんな感じだった。',
                'チャンピオンだ。'
            },
            dckst_knicks_5_loss = {
                '一つの悪い目が出て、',
                'すべて煙になった'
            },
            dckst_typewriter_1_win = {
                'ああ、素晴らしい話だ、',
                '打ちたてで勝利を掴んだ'
            },
            dckst_typewriter_1_loss = {
                'リボンが乾いてる、',
                'このランと同じだ'
            },
            dckst_typewriter_2_win = {
                'また一ページ、また',
                '勝利だ、親愛なる読者よ'
            },
            dckst_typewriter_2_loss = {
                '今回は違うキーを',
                '打ってしまったな、まったく'
            },
            dckst_typewriter_3_win = {
                'きれいにコピーして、正しく',
                '印刷した、実に立派な勝利だ'
            },
            dckst_typewriter_3_loss = {
                '最悪のタイミングで',
                '詰まってしまった'
            },
            dckst_typewriter_4_win = {
                '傑作だ、自分で',
                '言うのもなんだが'
            },
            dckst_typewriter_4_loss = {
                'すべての草稿が',
                '最終版になるわけじゃない'
            },
            dckst_typewriter_5_win = {
                'チン!行末に着いた、',
                'そして勝利だ'
            },
            dckst_typewriter_5_loss = {
                'キャリッジから',
                '引き裂かれた、未完成のまま'
            },
            dckst_airborne_piano_1_win = {
                'まだ落下中、まだ',
                '勝ってる、物理法則は無視だ'
            },
            dckst_airborne_piano_1_loss = {
                '終端速度に達して、',
                '終端の敗北にも達した'
            },
            dckst_airborne_piano_2_win = {
                'X5.5で落下中、',
                'でもランは持ちこたえた!'
            },
            dckst_airborne_piano_2_loss = {
                '重要になる前に',
                '叩き潰された'
            },
            dckst_airborne_piano_3_win = {
                '落ちながら鍵盤を',
                '一つ一つ叩いた。勝利だ。'
            },
            dckst_airborne_piano_3_loss = {
                '今回は重力が',
                '勝った、お前じゃない'
            },
            dckst_airborne_piano_4_win = {
                'MITも誇りに思うだろう。',
                'それに俺たちも勝った'
            },
            dckst_airborne_piano_5_win = {
                'コンサートは終わった、',
                '観客は大興奮だ'
            },
            dckst_airborne_piano_4_loss = {
                '先に計算を',
                'すべきだったな'
            },
            dckst_airborne_piano_5_loss = {
                '何もかも崩れた、',
                'ランと同じように'
            },
            dckst_pathogen_1_win = {
                'コピーを広げろ、',
                'カオスを広げろ、勝利を広げろ'
            },
            dckst_pathogen_1_loss = {
                '感染は今回',
                '定着しなかった'
            },
            dckst_pathogen_2_win = {
                '二つが四つになった、',
                'お前は気づきもしなかったな~'
            },
            dckst_pathogen_2_loss = {
                '株がうまく',
                '変異しなかった'
            },
            dckst_pathogen_3_win = {
                '伝染性のいたずら、',
                'だろう?'
            },
            dckst_pathogen_3_loss = {
                '宿主なし、コピーなし、',
                '今回は楽しみなし'
            },
            dckst_pathogen_4_win = {
                'お前の背後で',
                '複製した、へへ'
            },
            dckst_pathogen_4_loss = {
                '完璧な条件を逃した、',
                'なんてつまらない'
            },
            dckst_pathogen_5_win = {
                'コピー、コピー、そして',
                '勝利がただ...起こる'
            },
            dckst_pathogen_5_loss = {
                '病原体には適切な',
                '宿主が必要らしい'
            },
            dckst_pawprints_1_win = {
                'その勝利にちょっとした',
                '肉球の跡を残した'
            },
            dckst_pawprints_1_loss = {
                '強化なし、跡なし、',
                '運もなし'
            },
            dckst_pawprints_2_win = {
                'カードの上にちょうど',
                '踏み込んで、くっついた!'
            },
            dckst_pawprints_2_loss = {
                '跡を残す前に',
                '立ち去ってしまった'
            },
            dckst_pawprints_3_win = {
                '三分の一が、',
                '完璧に決まった'
            },
            dckst_pawprints_3_loss = {
                '確率が今回は',
                '味方しなかった'
            },
            dckst_pawprints_4_win = {
                '小さな肉球、大きな',
                '強化、もっと大きな勝利'
            },
            dckst_pawprints_4_loss = {
                '綺麗なカード、綺麗な',
                '敗北、跡形もなし'
            },
            dckst_pawprints_5_win = {
                'そのスコアボード全体に',
                '跡を残した'
            },
            dckst_pawprints_5_loss = {
                '重要な歩みを',
                '全部逃した'
            },
            dckst_rook_1_win = {
                '駒を犠牲にして、',
                'ゲーム全体に勝った'
            },
            dckst_rook_1_loss = {
                '終盤で',
                '大失着だ、残念'
            },
            dckst_rook_2_win = {
                'ルークが取り、',
                'ルークが勝つ'
            },
            dckst_rook_2_loss = {
                'それは投了に値する',
                '局面だな'
            },
            dckst_rook_3_win = {
                '盤をきれいにして、',
                '勝利を主張した'
            },
            dckst_rook_3_loss = {
                'そこからキャスリングして',
                '逃げるべきだった'
            },
            dckst_rook_4_win = {
                'X1.75も強くなって',
                'まだ飢えてる。チェックメイトだ。'
            },
            dckst_rook_4_loss = {
                '駒を交換して何も',
                '得なかった、大きなミスだ'
            },
            dckst_rook_5_win = {
                'ジョーカーが一つ減り、',
                '旗がもう一つ掲げられた'
            },
            dckst_rook_5_loss = {
                'ルークは満腹だが、',
                'ランはまだ飢えてる'
            },
            dckst_giggler_1_win = {
                'ヘヘヘ~ 絵札一枚一枚が',
                'お前をさらに追い詰めた'
            },
            dckst_giggler_1_loss = {
                'へっ...笑うための',
                '顔札が足りなかった'
            },
            dckst_giggler_2_win = {
                'テヘヘ!ユニークな絵札を',
                'いい感じに積み上げたな'
            },
            dckst_giggler_2_loss = {
                'そのハンドの',
                'どこが面白いんだ、正直'
            },
            dckst_giggler_3_win = {
                '笑いながら',
                '+マルチの街まで一直線!'
            },
            dckst_giggler_3_loss = {
                'そのジョークは今回',
                'ウケなかったな'
            },
            dckst_giggler_4_win = {
                'ユニークな絵札一枚一枚が',
                'ただただ面白い、へへ'
            },
            dckst_giggler_4_loss = {
                '静寂。これじゃ',
                '笑い声すら出ない'
            },
            dckst_giggler_5_win = {
                'キング、クイーン、ジャック~',
                '全員この芸に本気だ!'
            },
            dckst_giggler_5_loss = {
                '一緒に笑う顔札が',
                '尽きてしまった'
            },
            dckst_perrobabli_1_win = {
                'すべての確率が均され、',
                '運はお前の味方だった'
            },
            dckst_perrobabli_1_loss = {
                'コインは今回',
                '間違った側に落ちた'
            },
            dckst_perrobabli_2_win = {
                'バランスは回復し、',
                'お前が優位に立った'
            },
            dckst_perrobabli_2_loss = {
                '五分五分は与えもすれば、',
                '五分五分は奪いもする'
            },
            dckst_perrobabli_3_win = {
                '極端なし、容赦もなし、',
                'ただ完璧なコイントスだ'
            },
            dckst_perrobabli_3_loss = {
                '五分五分でも',
                '負けることはある'
            },
            dckst_perrobabli_4_win = {
                'すべての確率を中央に引き寄せ、',
                '中央が勝った'
            },
            dckst_perrobabli_4_loss = {
                '中間地点だけでは',
                '足りなかった'
            },
            dckst_perrobabli_5_win = {
                'コイントスが決めて、',
                'お前は正しく読んだ'
            },
            dckst_perrobabli_5_loss = {
                '読み違えたな。',
                'それがベルカーブってやつだ'
            },
            dckst_quadratic_equation_1_win = {
                'カーブがお前の',
                '味方に曲がった'
            },
            dckst_quadratic_equation_1_loss = {
                'これを解くには',
                'カードが足りなかった'
            },
            dckst_quadratic_equation_2_win = {
                'マルチが上がり、',
                '上がり、飛んでいく!'
            },
            dckst_quadratic_equation_2_loss = {
                '方程式が今日は',
                '合わなかった'
            },
            dckst_quadratic_equation_3_win = {
                '四枚ごとに次の四枚が',
                'より恐ろしくなった'
            },
            dckst_quadratic_equation_3_loss = {
                '放物線であるべき所が',
                '直線のままだった'
            },
            dckst_quadratic_equation_4_win = {
                '指数関数的な成長、',
                '指数関数的な勝利'
            },
            dckst_quadratic_equation_4_loss = {
                'このラウンドは',
                'ゼロ勝で解決した'
            },
            dckst_quadratic_equation_5_win = {
                '式は合ってる。',
                '勝利もだ。'
            },
            dckst_quadratic_equation_5_loss = {
                '結果は未定義。',
                'もう一度試せ。'
            },
            dckst_naturalist_1_win = {
                '自然は与える、',
                'そして今回は大盤振る舞いだった'
            },
            dckst_naturalist_1_loss = {
                '自然は今日は',
                '休みだったようだ'
            },
            dckst_naturalist_2_win = {
                '葉っぱ一枚、根っこ一本、',
                '勝利一つ。美しい。'
            },
            dckst_naturalist_2_loss = {
                '森はこのラウンド',
                '静かなままだった'
            },
            dckst_naturalist_3_win = {
                '六分の一が花開いて、',
                'ラン全体が咲き誇った'
            },
            dckst_naturalist_3_loss = {
                '今日は一粒の種も',
                '根付かなかった'
            },
            dckst_naturalist_4_win = {
                '母なる自然自身が',
                'この勝利を認めてる'
            },
            dckst_naturalist_4_loss = {
                '野生にも',
                '調子の悪い日はある'
            },
            dckst_naturalist_5_win = {
                'ブラインドを突き抜けて',
                '育った。見事だ。'
            },
            dckst_naturalist_5_loss = {
                '今日は自然が何も',
                '返してくれなかった'
            },
            dckst_sticky_note_1_win = {
                'ただの付箋だけど、',
                'すべてを変えた!'
            },
            dckst_sticky_note_1_loss = {
                'あちゃー、付箋が',
                '今回はくっつかなかった...'
            },
            dckst_sticky_note_2_win = {
                '仲間にちょっと愛を',
                '貼り付けて、うまくいった!'
            },
            dckst_sticky_note_2_loss = {
                'かわいいちょっとした',
                'ブーストでもこれは救えなかった'
            },
            dckst_sticky_note_3_win = {
                'ちょっとしたリマインダーが',
                '大きな勝利につながった!'
            },
            dckst_sticky_note_3_loss = {
                'あら、付箋が',
                '剥がれちゃった、おっと'
            },
            dckst_sticky_note_4_win = {
                '良いバイブスと',
                '+5マルチを送るよ、やった!'
            },
            dckst_sticky_note_4_loss = {
                'すべての付箋が',
                '一日を救うわけじゃない'
            },
            dckst_sticky_note_5_win = {
                '小さな付箋、大きな',
                '心、もっと大きな勝利'
            },
            dckst_sticky_note_5_loss = {
                'ごめん、粘着の魔法が',
                '切れちゃった'
            },
            dckst_currency_exchange_1_win = {
                'ティッカーを交換して、',
                '市場をプラスで締めた'
            },
            dckst_currency_exchange_1_loss = {
                '為替レートが',
                'お前の味方じゃなかった'
            },
            dckst_currency_exchange_2_win = {
                'チップをマルチに、マルチを',
                '利益に。強気相場だ。'
            },
            dckst_currency_exchange_2_loss = {
                '交換が必要な時に',
                '市場が暴落した'
            },
            dckst_currency_exchange_3_win = {
                '安く買って、高く',
                '決めた、教科書通りの取引だ'
            },
            dckst_currency_exchange_3_loss = {
                'それは厳しい',
                '四半期の締めくくりだな'
            },
            dckst_currency_exchange_4_win = {
                '数字をひっくり返して、',
                '結果もひっくり返した'
            },
            dckst_currency_exchange_4_loss = {
                'ボラティリティがこの',
                'ランを打ちのめした'
            },
            dckst_currency_exchange_5_win = {
                'NASDAQもこの取引には',
                '敵わないな'
            },
            dckst_currency_exchange_5_loss = {
                '安く売って、大きく',
                '損した。厳しいセッションだ。'
            },
            dckst_currency_exchange_6_win = {
                'ウォール街もこんな風に',
                '取引したいだろうな'
            },
            dckst_currency_exchange_6_loss = {
                'ウォール街にも',
                '悪い日はある'
            },
            dckst_coin_jar_1_win = {
                '瓶は空だけど',
                '財布はいっぱいだ!'
            },
            dckst_coin_jar_1_loss = {
                'あれだけ貯めて',
                '出すものがない'
            },
            dckst_coin_jar_2_win = {
                'チャリーン!コイン一枚一枚が',
                '大きく報われた'
            },
            dckst_coin_jar_2_loss = {
                '瓶は今回',
                '閉まったままだった'
            },
            dckst_coin_jar_3_win = {
                '貯めて、現金化して、',
                '金持ちで去った'
            },
            dckst_coin_jar_3_loss = {
                '雨の日のための貯金は',
                'その日を迎えられなかった'
            },
            dckst_coin_jar_4_win = {
                '忍耐が報われた、',
                '文字通り、一気に'
            },
            dckst_coin_jar_4_loss = {
                'コインはそこに座って',
                'いただけだった、使われずに'
            },
            dckst_coin_jar_5_win = {
                'ジャックポットを',
                'ちょうど重要な時に注いだ!'
            },
            dckst_coin_jar_5_loss = {
                '貯金箱を割る機会が',
                '一度もなかった'
            },
            dckst_cupboard_1_win = {
                'しまっておいて、',
                '完璧に出した'
            },
            dckst_cupboard_1_loss = {
                '戸棚は今回',
                '空っぽのままだった'
            },
            dckst_cupboard_2_win = {
                'チップの半分で、',
                '見返りは全部'
            },
            dckst_cupboard_2_loss = {
                'そのハンドには',
                'しまう価値のあるものがなかった'
            },
            dckst_cupboard_3_win = {
                '保存して、出して、',
                '勝利を確保した'
            },
            dckst_cupboard_3_loss = {
                '棚は空っぽ、',
                'ランも空っぽ'
            },
            dckst_cupboard_4_win = {
                '少し貯めたチップが',
                '大きな効果を生む'
            },
            dckst_cupboard_4_loss = {
                '今回は取り出すものが',
                'あまりなかった'
            },
            dckst_cupboard_5_win = {
                '戸棚を開けたら、',
                '勝利が出てきた'
            },
            dckst_cupboard_5_loss = {
                'ハンドが終わる前に',
                '干上がった'
            },
            dckst_endpoints_1_win = {
                '両端が二回発動して、',
                '勝利のど真ん中に'
            },
            dckst_endpoints_1_loss = {
                '端じゃなくて',
                '真ん中にやられた'
            },
            dckst_endpoints_2_win = {
                '左右とも、',
                '二回発動して総取りだ'
            },
            dckst_endpoints_2_loss = {
                'そのハンドを救うには',
                '再発動が足りなかった'
            },
            dckst_endpoints_3_win = {
                'そのハンドを完璧に',
                '両端で挟んだ'
            },
            dckst_endpoints_3_loss = {
                '端っこが今回は',
                '仕事をしなかった'
            },
            dckst_endpoints_4_win = {
                '端から端まで、',
                '全部勝利だ'
            },
            dckst_endpoints_4_loss = {
                '残念ながら敗北も',
                '再発動してしまった'
            },
            dckst_endpoints_5_win = {
                '強く始めて、もっと強く',
                '終わり、勝利を掴め'
            },
            dckst_endpoints_5_loss = {
                'どちらの端も今回は',
                '仕事をしなかった'
            },
            dckst_the_town_1_win = {
                'ちょうどゼロに、',
                'そして街全体が沸き立つ'
            },
            dckst_the_town_1_loss = {
                'お金は今回',
                'ゼロに着地しなかった'
            },
            dckst_the_town_2_win = {
                'それこそ遠くからの',
                'スプラッシュだ!'
            },
            dckst_the_town_2_loss = {
                'The Townはこの',
                'ラウンド静かだった'
            },
            dckst_the_town_3_win = {
                '完璧に丸まって、',
                '勝利に丸まった'
            },
            dckst_the_town_3_loss = {
                'あのゼロに、あの',
                'ボーナスに、あと少しだった'
            },
            dckst_the_town_4_win = {
                'ベイエリアの魔法が',
                'まっすぐ銀行へ'
            },
            dckst_the_town_4_loss = {
                'このラウンドは',
                '計算が合わなかった'
            },
            dckst_the_town_5_win = {
                'ゼロに当たり、大きく',
                '当たり、歴史に残った'
            },
            dckst_the_town_5_loss = {
                'ドルが今回は',
                '協力してくれなかった'
            },
            dckst_cantor_set_1_win = {
                '分割して、征服して、',
                '勝利へまっすぐ掛け合わせた'
            },
            dckst_cantor_set_1_loss = {
                'そのスケーリングを支えるには',
                '足りなかった'
            },
            dckst_cantor_set_2_win = {
                '真ん中を切り取って、',
                '勝利を残した'
            },
            dckst_cantor_set_2_loss = {
                'フラクタルが今回は',
                'お前の味方じゃなかった'
            },
            dckst_cantor_set_3_win = {
                '三分の一を取り除いて、',
                'チップを掛け合わせ、勝利確保'
            },
            dckst_cantor_set_3_loss = {
                '計算を成り立たせるには',
                '残りが少なすぎた'
            },
            dckst_cantor_set_4_win = {
                '無限の分割、',
                'とても有限な勝利だ'
            },
            dckst_cantor_set_4_loss = {
                '壊しすぎて、',
                '残しすぎなかった'
            },
            dckst_cantor_set_5_win = {
                '残ったものがより強く決まる。',
                '再び証明された'
            },
            dckst_cantor_set_5_loss = {
                '集合が崩壊し、',
                'ランも崩壊した'
            },
            dckst_blkyn_1_win = {
                'スコアされなかったカード一枚一枚が',
                'それでも大きく貢献した'
            },
            dckst_blkyn_1_loss = {
                '本当に積み上がる前に',
                'リセットされた'
            },
            dckst_blkyn_2_win = {
                'そのXマルチは静かに、',
                'それから大きく積み上がった'
            },
            dckst_blkyn_2_loss = {
                'このラウンドは',
                '十分に残せなかった'
            },
            dckst_blkyn_3_win = {
                'スコアされなかったものも',
                'やっぱり重要だった'
            },
            dckst_blkyn_3_loss = {
                '見返りが来る前に',
                'リセットが発動した'
            },
            dckst_blkyn_4_win = {
                'ブルックリンは何もない所から',
                'その乗数を築いた'
            },
            dckst_blkyn_4_loss = {
                '新たなスタート、',
                '同じ結果、残念だが'
            },
            dckst_blkyn_5_win = {
                '残ったカード一枚一枚が',
                'その義務を大きく果たした'
            },
            dckst_blkyn_5_loss = {
                '重要になる直前に',
                '盤面が片付けられた'
            },
            dckst_peachtree_1_win = {
                'ストレートからエースへ、',
                'そのまま勝利へ'
            },
            dckst_peachtree_1_loss = {
                '手札にエースなし、',
                'このラウンド魔法なし'
            },
            dckst_peachtree_2_win = {
                'そのコンボは決勝点の',
                'ように決まった'
            },
            dckst_peachtree_2_loss = {
                'ストレートは来たが、',
                'エースは来なかった'
            },
            dckst_peachtree_3_win = {
                'ピーチツリー・スペシャル、',
                'まっすぐ銀行へ'
            },
            dckst_peachtree_3_loss = {
                '惜しかったが、締める',
                'エースがなかった'
            },
            dckst_peachtree_4_win = {
                'ATLの魔法が、',
                'ちょうど合図通りに'
            },
            dckst_peachtree_4_loss = {
                '惜しかった。惜しいは',
                'X2じゃない'
            },
            dckst_peachtree_5_win = {
                'それがコンボ全部だ、',
                'それが勝利だ'
            },
            dckst_peachtree_5_loss = {
                '今回はパズルの',
                'ピースが一つ足りなかった'
            },
        },
        dckst_misc = {
            mod_label = {
                {"decksterity."},
                {"デックステリティ。"},
                {"デッキ・ザ・", "フリーキン・ステリティ！！"},
                {"dckst."},
                {"デック商店街"},
                {"mariopuffとUN4YAの", "渾身のBalatro改造"},
                {"DCKST"},
                {"でっくすてりてぃ"},
                {"悪の decksterity."},
                {"グレッグステリティ。"},
                {"デクストラス過ぎるモッド"},
                {"何のデッキだよ。"},
                {"デ。ッ。ク。ス。テ。リ。テ。ィ。"},
                {"【【【 デ ッ ク ス テ リ テ ィ 】】】"},
                {"トレクステリティ"},
                {"でっきでっきでっきでっき"},
                {"で・っ・く・す・て・り・て・ぃ"},
                {".ytiretskced"},
                {"ﾃﾞｯｸｽﾃﾘﾃｨ。"},
                {"DDDDDDDDDD"},
                {"セガ デックステリティ"},
                {"でくすてぃりてぃ"},
                {"デックスターとジョーカーたち"},
                {"手先の器用さ、それ以上"},
                {"d3ckst3r1ty"},
                {"デックステリティ（2024）"},
                {"でくすてりてー"},
                {"ザ・デックスター"},
                {"デックまたは/およびステリティ"},
                {"デックステラスな活動"},
                {"名前も知らないBalatro改造"},
                {"デック……ステリティ？"},
                {"劣化版デックステリティ"},
                {"デックステリティ アルティメット", "デラックス エディション"},
                {"decksterity™®©"},
                {"デックスターの実験室"},
                {"カードゲームモジュール"},
                {"デックステリティ", "デックステリティ", "デックステリティ"},
                {"デックステリティ・ドット・lua"},
                {"多分カードゲームです"},
                {"でっ", "くす", "てりてぃ"},
                {"デックステリティ2：エレクトリック・ブギャルー"},
                {"デックSTERITY（真ん中だけ大文字）"},
                {"デックスター シネマティック ユニバース"},
                {"unfuffy 謹製：デックステリティ"},
                {"深夜にコーディングした", "デックステリティ"},
                {"で・っ・く・す・て・り・て・ぃ。"},
                {"デックステリティ（色つき）"},
                {"デックステリティ：リマスター版"},
                {"でっくすてりてぃぃぃぃ"},
                {"Balatro Discord勢が贈る", "デックステリティ"},
                {"UN4YAの熱い夢"},
                {"mariopuffの最高傑作"},
                {"デックステリティ（監督版）"},
                {"でくすてぃにー"},
                {"スポンサーなしのデックステリティ"},
                {"THE デックステリティ体験™"},
                {"で・っ・く・す・て・り・て・ぃ（音読推奨）"},
                {"デックステリティ", "（パッチ1.0.0.0.0.1）"},
                {"デックステリティ：", "バラトロ・オデッセイ"},
                {"デックステリティ.exe", "は動作を停止しました"},
                {"永遠にベータ版のデックステリティ"},
                {"デックステリティ but", "全部燃えてる"},
                {"デックステリティ", "（完全版）"},
                {"4Kデックステリティ"},
                {"デックステリティ", "（違う、そっちじゃない方）"},
                {"Hのための", "ヘッキンなデックステリティ"},
                {"デックHステリティ"},
                {"HHHHHHHHHH"},
                {"ストレート一直線", "デックステリティ"},
                {"デックステリH"},
                {"H：モッド、神話、", "そして伝説"},
                {"Hの文字も", "このモッドを承認済み"},
                {"デックHテリティ", "（Hは無音、嘘です）"},
                {"ストレート専門、", "余計なことはしない"},
                {"H H H H H H H"},
                {"デックステリティ（H級）"},
                {"ガチのHな", "モッドです"},
                {"デックHストレートHィティ"},
                {"H'd it and loved it"},
            },
            flavor_text = {
                {"実力不足？いいえ、","デッキ不足です。"},
                {"デックの葉っぱで", "門松を飾ろう！！"},
                {"がんばれ我らが推し力士！"},
                {"「必ず戻る。」","とある関取が", "そう言ったとか言わなかったとか。"},
                {"優勝決定戦、あの一番は", "今でも語り草。"},
                {"横綱は正義。"},
                {"メグ、うるさいって。"},
                {"うちの柴犬、たぶん一番賢い犬"},
                {"誰だよこれ改造したの！？"},
                {"MVP！MVP！MVP！"},
                {"お手柔らかに、SGA！"},
                {"このモッド、Cryptidより", "面白いって、マジで。"},
                {"完全にバランス取れてる", "モッドです、文句なし！"},
                {"UN4YA、混沌の神"},
                {"LocalThunkが見たら", "百年経っても気づかないと思う"},
                {"アイコシェンのパクリじゃ", "ないですマジで"},
                {"「ジャズ、お好き？」"},
                {"このモッド、桃太郎電鉄の", "台詞を全部漏らします"},
                {"nicoのネクストボット軍団に感謝！"},
                {"ローマ字打ちできないと", "decksterityも打てない"},
                {"この文章は読まないでください"},
                {"豆知識：今日25回目のプレイなら", "そろそろ休憩しましょう"},
                {"豆知識：豆知識"},
                {"豆知識：精一杯やって百円くらい"},
                {"豆知識：このモッドを質屋に", "持っていったら", "億万長者になれるかも"},
                {"どこかの動画勢もきっと", "このモッドを推してくれるはず"},
                {"30日間返金保証付き！", "（このモッド無料だけど）"},
                {"このモッドを落とさないでください。", "とても壊れやすいです。"},
                {"推しへのバレンタインに", "ぴったりの贈り物"},
                {"我らが横綱に、", "来場所も皆勤を！"},
                {"新弟子のあの子、", "なかなかいい相撲取るよね"},
                {"アイコヨリ、これを読んでいたら", "このゲームの崩し方教えてください"},
                {"ギャンブラーにも", "非ギャンブラーにも捧げる"},
                {"がんばれ我らが投手！！"},
                {"開発の半分は", "野球好きです。"},
                {"今夜は絶対勝つぞ！！"},
                {"あの一戦、伝説になりました。"},
                {"VSCodeのインライン提案、", "地味に便利"},
                {"このモッドでDOOMも", "動かせるらしいです！"},
                {"打った瞬間わかるやつ！！"},
                {"mariopuffにテクニカルファウル"},
                {"97 97 97"},
                {"ロナウド選手", "シュウウウウウウウ"},
                {"にこぱてぃ！"},
                {"あのトレード、", "解説者もびっくり"},
                {"機能、もう少し増えるかも"},
                {"ロクナナ"},
                {"横浜大洋ホエールズ。"},
                {"あのレジェンドは、", "永遠にレジェンド。"},
                {"ケーキはケーキです。", "他に何だと思ったんですか？嘘だとでも？"},
                {"ギャンブルはダメ、", "絶対！"},
                {"機内での喫煙は", "ご遠慮ください"},
                {"パフィー航空を", "ご利用いただき", "ありがとうございます！"},
                {"乗り物酔いの原因は", "乗り物です"},
                {"このモッドはノートPCで", "コーディングされました"},
                {"あのラッパー、天才すぎる"},
                {"七夕おめでとうございます！"},
                {"このモッドを使うのに", "お金は一切かかりません"},
                {"メグのフルネームは", "メガトロンです！（嘘）"},
                {"我らが横綱を信じろ"},
                {"まさかの大波乱！"},
                {"あの大横綱に、", "安らかに。"},
                {"あの選手、渋いよね"},
                {"下位チーム同士の", "対決も熱い"},
                {"東京、燃えてないですよね？大丈夫ですよね？"},
                {"あのシーズンの", "健闘は称えたい"},
                {"このモッドは", "お財布に優しいです！"},
                {"もしこのモッドが", "バスケしたら", "きっとMVP級"},
                {"静かな不発か、", "派手な空振りか"},
                {"「入りました！！」", "－実況アナウンサー"},
                {"「ナイスシュート！！」", "－実況アナウンサー"},
                {"このモッドはシュートを", "外しません！"},
                {"相棒、この車最高だぜ！", "運転しながらアニメも", "見られるんだ！"},
                {"はは、あのアニメの動物", "面白すぎて、脇見運転しちゃう！"},
                {"安心してください、", "GPUは無事です。"},
                {"やあ、Vsauceのマイケルです。"},
                {"あなたの家は安全です……", "多分。"},
                {"鼻から牛乳、口から鼻血"},
                {"息子よ 😭"},
                {"ちょっとしたやんちゃ坊主"},
                {"にゃーん、抱っこして"},
                {"野菜製品の一種"},
                {"近所のトイレでもうすぐ発売"},
                {"違う味を、感じて"},
                {"商品配達用の回転装置、継続稼働中"},
                {"アイスコーヒーみたいに！"},
                {"灯りの棲家は記憶みたいなもの"},
                {"全部アルミニウムです"},
                {"これはもう解決済みです"},
                {"スーヴァスト・ノートブッカリー"},
                {"市民的な跳弾"},
                {"今なら最低5枚のカード付き"},
                {"新鮮なラップ包装、理解しなくていい"},
                {"（両利きエディション）"},
                {"今なら不便さ30%増し"},
                {"密閉容器に保管してください"},
                {"可燃物注意！"},
                {"誰の承認も得ていません"},
                {"湿気の多い場所での保管は避けてください"},
                {"猫の鳴き声つき"},
                {"ハイカー向け"},
                {"タラッタラッタッタッタ", "国民的レーサー"},
                {"あのF1レーサー、次戦も王座奪還なるか"},
                {"「その化粧廻し、渋いね」"},
                {"（スロー＋リバーブ）"},
                {"（速度アップ版）"},
                {"（某有名ラッパーfeat.）"},
                {"（某ヒップホップデュオfeat.）"},
                {"（某天才ラッパーfeat.）"},
                {"（キング・オブ・ポップfeat.）"},
                {"究極の猫モッド！"},
                {"スリラー、", "スリラーな夜だぜ"},
                {"僕はワルなのさ、", "（本当にワルなのさ）"},
                {"誰かに見られてる気がする", "いつもそんな気がするんだ"},
                {"無限の彼方へ、そして横綱へ"},
                {"アイコヨリのシェナニガンズと", "一緒に遊ぶのがおすすめ！"},
                {"三冠達成！", "アラート発令！"},
                {"あの新人、", "まだ本気出してないと思う"},
                {"引退セレモニー、", "また見たい"},
                {"優勝候補筆頭は、", "早めに決まってた"},
                {"あと一勝でシリーズ制覇、", "もしくはそれ以下！"},
                {"あの選手、駐車場から", "シュート打ってくる勢い"},
                {"「それはファウルです。」", "－あらゆる審判、いつも"},
                {"あのダンク、", "リム防御の概念ごと粉砕"},
                {"歴史に残る一戦、", "（あとこのモッドも）"},
                {"あの補強、即戦力すぎる"},
                {"うちのチームは", "「育成優先」で通ってます"},
                {"あの若手、生きるレジェンド", "候補、異論は認める"},
                {"3ポイントラインは", "もはや提案程度のもの"},
                {"優勝決定戦は全部", "サヨナラで終わるべき"},
                {"豆知識：これは投資アドバイスでは", "ありません。カードゲームです。"},
                {"豆知識：水分補給してください。", "カードはそれをしてくれません。"},
                {"豆知識：ジョーカーは実際には", "冗談を言いません。すみません。"},
                {"豆知識：混乱したら", "一度電源を入れ直しましょう"},
                {"豆知識：人生にスキップ", "ボタンはありません"},
                {"警告：ジョーカーの相性を", "極めすぎると絶叫する恐れがあります"},
                {"実績解除：この説明文を", "最後まで読んだ"},
                {"デッキはあなたのしたことを", "知っている"},
                {"シャッフルは", "セルフケアの一種"},
                {"デックSTERITYのSTERは", "本気の証"},
                {"古から伝わる", "たぶんカードの儀式"},
                {"あなたが負けたすべての", "ハンドに捧ぐ"},
                {"エラー404：戦略が", "見つかりません"},
                {"新鮮さ証明済みデッキ", "（誰の審査も通してない）"},
                {"カードで見る白昼夢"},
                {"RNGの神に祝福された"},
                {"RNGの神に呪われた"},
                {"ヌルポ", "（バグじゃなくてカードです）"},
                {"スタックオーバーフロー、", "ただしジョーカースロットの話"},
                {"セグメンテーション違反：", "スキル不足"},
                {"「バグじゃない、", "仕様だ」－UN4YA談"},
                {"「仕様じゃない、", "バグだ」－mariopuff談"},
                {"徹底的にテスト済み", "（誰も担当してません）"},
                {"QAチームは", "二人と一つの夢だけで構成"},
                {"このモッドは", "勢いとカフェインで動いています"},
                {"Lua、勇者の言語", "（そして苦行の言語）"},
                {"なぜ動くのか", "開発者にもわかりません"},
                {"壊れてないなら", "ジョーカーを増やせばいい"},
                {"バランス調整予定", "（ナレーター：やりませんでした）"},
                {"あと一個だけ機能追加、", "約束します（嘘です）"},
                {"スコープクリープ：モッド版"},
                {"「あと一個だけジョーカー」って", "もう47個目です"},
                {"友達に「やめとけ」と言われた", "モッドと、あなた"},
                {"ジョーカーたちを", "野に放て"},
                {"あの淡い赤、もはや", "個性の一部です"},
                {"#ff746c 至上主義"},
                {"意地とスタックトレースで", "動いています"},
                {"Ctrl+Zがかなり", "頑張ってくれています"},
                {"「とりあえずリリースしよう」", "－誰か、残念なことに"},
                {"本番環境でテストしています", "（他に選択肢がない）"},
                {"git blameすると", "結局二人とも同じくらい悪い"},
                {"マージコンフリクトは", "腕相撲で解決しました"},
                {"コミットメッセージ：「修正」"},
                {"コミットメッセージ：「なんで", "動くのかわからないけど直った」"},
                {"このモッド、", "分別より多いジョーカー数"},
                {"デックステリティ：さらに", "デックステリティを追加"},
                {"皆さん", "（モッド開発陣より）"},
                {"夏のパッチには", "夏のバグがつきもの"},
                {"外に出る代わりに", "これをコーディングしました"},
                {"あのレジェンド選手：", "GOATって言って間違いない"},
                {"シュウウウウウウウウウウウウウ"},
                {"あの選手は永遠に", "現役でいてほしい"},
                {"年齢を重ねても", "レベルアップし続ける、", "本物の化け物"},
                {"40歳超えてもオーバーヘッドキック、", "もはや人間の枠外"},
                {"「落ち着け、落ち着け、", "落ち着け」－某レジェンド選手"},
                {"個人タイトル、", "もう数えるのやめました（多分）"},
                {"あの選手：20年以上", "第一線に君臨"},
                {"王者は休まない"},
                {"あの選手、記録更新しても", "まだまだ止まらない"},
                {"「私がいないと", "優勝できないよ」", "－どこかの誰か、たぶん"},
                {"衰える気配、", "一切なし"},
                {"あの選手の息の長さは", "もはや物理法則違反"},
                {"選ばれし者は、", "毎回きっちり結果を出す"},
                {"あのレーサー：", "四輪の中で一番速い男"},
                {"あの人はブレーキじゃなくて", "早めに勝つだけ"},
                {"あのチームの秘密兵器は", "あの人自身"},
                {"周回遅れにする、", "文字通りに"},
                {"「ポールポジション。", "当然でしょ。」", "－あのレーサー、たぶん"},
                {"タイトルの数が", "積み上がっていく一方"},
                {"サッカー界のGOAT、", "バスケ界のGOAT、", "そしてモータースポーツ界のGOAT"},
                {"あの3人が揃えば、", "まさにスポーツ界の", "ラシュモア山"},
                {"偉大さは偉大さを知る"},
                {"記録を追う選手もいれば、", "その人自身が記録という選手もいる"},
            },
        }
    }
}