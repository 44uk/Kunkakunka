# coding: utf-8
class Kunkakunka::Text
  attr_accessor :name, :full_name,
    :hair_color, :novel, :n_vol, :anime, :season, :comics, :c_vol, :location,
    :other1, :other2, :other3, :other4, :other5,
    :strip_newline

  attr_reader :name_with_gasp, :name_with_space

  def initialize(attributes = nil)
    assign_attributes(attributes) if attributes
    yield self if block_given?
  end

  def assign_attributes(new_attributes)
    new_attributes.each do |k, v|
      send("#{k.to_s}=", v) if respond_to?("#{k.to_s}=")
    end
  end

  def template
    %q(%name%！%name%！%name%！%name_with_gasp1%わぁああああああああああああああああああああああん！！！
あぁああああ…ああ…あっあっー！あぁああああああ！！！%name%%name%%name_with_gasp2%ぁわぁああああ！！！
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
あっあんああっああんあ%other2%！！%other3%！！%other4%！！！%other5%！！
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
    self.other2     ||= 'アン様'
    self.other3     ||= 'セイバー'
    self.other4     ||= 'シャナ'
    self.other5     ||= 'ヴィルヘルミナ'

    copypaste = self.template
      .gsub(/%name%/,     self.name)
      .gsub(/%full_name%/,  self.full_name)
      .gsub(/%hair_color%/, self.hair_color)
      .gsub(/%name_with_gasp1%/, Kunkakunka::Text.gaspize(self.name))
      .gsub(/%name_with_gasp2%/, Kunkakunka::Text.gaspize(self.name, 1, 2))
      .gsub(/%name_with_space%/, Kunkakunka::Text.emphaize(self.name))
      .gsub(/%novel%/,    self.novel)
      .gsub(/%n_vol%/,    self.n_vol)
      .gsub(/%anime%/,    self.anime)
      .gsub(/%season%/,   self.season)
      .gsub(/%comics%/,   self.comics)
      .gsub(/%c_vol%/,    self.c_vol)
      .gsub(/%location%/, self.location)
      .gsub(/%other1%/,   self.other1)
      .gsub(/%other2%/,   Kunkakunka::Text.gaspize(self.other2, 1, 1))
      .gsub(/%other3%/,   Kunkakunka::Text.fluffize(self.other3))
      .gsub(/%other4%/,   Kunkakunka::Text.gaspize(self.other4, 1, 6))
      .gsub(/%other5%/,   Kunkakunka::Text.gaspize(self.other5, 1, 3))

    self.strip_newline ? copypaste.gsub(/\n/, '') : copypaste
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

    def gaspize(string, rep1 = 2, rep2 = 3)
      char = string[string.length-1]
      hira_map.merge(kana_map).each do |k, set|
        return string + set[0]*rep1 + set[1]*rep2 if k.include?(char)
      end
      string + 'ぁ'*rep1 + 'あ'*rep2
    end

    def emphaize(string)
      string.chars.map(&:to_s).join(' ')
    end

    def fluffize(string)
      "#{string[0]}、#{string}"
    end
  end
end
