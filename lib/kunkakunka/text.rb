# coding: utf-8
class Kunkakunka::Text
  attr_accessor :name, :full_name,
    :hair_color, :novel, :n_vol, :anime, :season, :comics, :c_vol, :location,
    :other1, :other2, :other3, :other4, :other5

  attr_reader :name_with_gasp, :name_with_space

  def initialize(*args)
    yield self if block_given?
  end

  def template
    %q(%name%！%name%！%name%！%name_with_gasp%わぁああああああああああああああああああああああん！！！
あぁああああ…ああ…あっあっー！あぁああああああ！！！%name%%name%%name_with_gasp%わぁああああ！！！
あぁクンカクンカ！クンカクンカ！スーハースーハー！スーハースーハー！いい匂いだなぁ…くんくん
んはぁっ！%full_name%たんの%hair_color%の髪をクンカクンカしたいお！クンカクンカ！あぁあ！！
間違えた！モフモフしたいお！モフモフ！モフモフ！髪髪モフモフ！カリカリモフモフ…きゅんきゅんきゅい！！
%novel%%n_vol%の%name%たんかわいかったよぅ！！あぁぁああ…あああ…あっあぁああああ！！ふぁぁあああんんっ！！
%anime%%season%決まって良かったね%name%たん！あぁあああああ！かわいい！%name%たん！かわいい！あっああぁああ！
%comics%%c_vol%も発売されて嬉し…いやぁああああああ！！！にゃああああああああん！！ぎゃああああああああ！！
ぐあああああああああああ！！！%comics%なんて現実じゃない！！！！あ…%novel%も%anime%もよく考えたら…
%name_with_space% ち ゃ ん は 現実 じ ゃ な い？にゃあああああああああああああん！！うぁああああああああああ！！
そんなぁああああああ！！いやぁぁぁあああああああああ！！はぁああああああん！！%location%ぁああああ！！
この！ちきしょー！やめてやる！！現実なんかやめ…て…え！？見…てる？表紙絵の%name%ちゃんが僕を見てる？
表紙絵の%name%ちゃんが僕を見てるぞ！%name%ちゃんが僕を見てるぞ！挿絵の%name%ちゃんが僕を見てるぞ！！
%anime%の%name%ちゃんが僕に話しかけてるぞ！！！よかった…世の中まだまだ捨てたモンじゃないんだねっ！
いやっほぉおおおおおおお！！！僕には%name%ちゃんがいる！！やったよ%other1%！！ひとりでできるもん！！！
あ、%comics%の%name%ちゃああああああああああああああん！！いやぁあああああああああああああああ！！！！
あっあんああっああんあ%other2%ぁあ！！%other3%！！%other4%ぁああああああ！！！%other5%ぁあああ！！
ううっうぅうう！！俺の想いよ%name%へ届け！！%location%の%name%へ届け！)
  end

  def to_s
    self.name       ||= 'ルイズ'
    self.full_name  ||= 'ルイズ・フランソワーズ'
    self.hair_color ||= '桃色ブロンド'
    self.novel      ||= '小説'
    self.n_vol      ||= '11巻'
    self.anime      ||= 'アニメ'
    self.season     ||= '2期'
    self.comics     ||= 'コミック'
    self.c_vol      ||= '2巻'
    self.location   ||= 'ハルケギニア'
    self.other1     ||= 'ケティ'
    self.other2     ||= 'アン'
    self.other3     ||= 'セイバー'
    self.other4     ||= 'シャナ'
    self.other5     ||= 'ヴィルヘミナ'

    self.template
      .gsub(/%name%/,     self.name)
      .gsub(/%full_name%/,  self.full_name)
      .gsub(/%name_with_gasp%/,  self.name_with_gasp)
      .gsub(/%name_with_space%/, self.name_with_space)
      .gsub(/%novel%/,    self.novel)
      .gsub(/%n_vol%/,    self.n_vol)
      .gsub(/%anime%/,    self.anime)
      .gsub(/%season%/,   self.season)
      .gsub(/%c_vol%/,    self.c_vol)
      .gsub(/%location%/, self.location)
      .gsub(/%other1%/,   self.other1)
      .gsub(/%other2%/,   self.other2)
      .gsub(/%other3%/,   self.other3)
      .gsub(/%other4%/,   self.other4)
      .gsub(/%other5%/,   self.other5)
  end

  def name_with_gasp
    # @name_with_gasp  ||= Kunkakunka::Text.gaspize(@name)
    Kunkakunka::Text.gaspize(@name)
  end

  def name_with_space
    # @name_with_space ||= Kunkakunka::Text.emphaize(@name)
    Kunkakunka::Text.emphaize(@name)
  end

  class << self
    def hira_map
      {
        %w[あ か さ た な は ま や ら わ が ざ だ ば ぱ] => ['ぁ', 'あ'],
        %w[い き し ち に ひ み い り ぎ じ ぢ び ぴ]    => ['ぃ', 'い'],
        %w[う く す つ ぬ ふ む ゆ る う ぐ ず づ ぶ ぷ] => ['ぅ', 'う'],
        %w[え け せ て ね へ め え れ げ ぜ で べ ぺ]    => ['ぇ', 'え'],
        %w[お こ そ と の ほ も よ ろ を ご ぞ ど ぼ ぽ] => ['ぉ', 'お']
      }
    end

    def kana_map
      {
        %w[ア カ サ タ ナ ハ マ ヤ ラ ワ ガ ザ ダ バ パ] => ['ぁ', 'あ'],
        %w[イ キ シ チ ニ ヒ ミ リ ヰ ギ ジ ヂ ビ ピ]    => ['ぃ', 'い'],
        %w[ウ ク ス ツ ヌ フ ム ユ ル ヴ グ ズ ヅ ブ プ] => ['ぅ', 'う'],
        %w[エ ケ セ テ ネ ヘ メ レ ヱ ゲ ゼ デ ベ ペ]    => ['ぇ', 'え'],
        %w[オ コ ソ ト ノ ホ モ ヨ ロ ヲ ゴ ゾ ド ボ ポ] => ['ぉ', 'お']
      }
    end

    def emphaize(string)
      string.chars.map(&:to_s).join(' ')
    end

    def gaspize(string)
      char = string[string.length-1]
      hira_map.merge(kana_map).each do |k, set|
        return string + set[0]*2 + set[1]*3 if k.include?(char)
      end
    end
  end
end
