# coding: utf-8
require File.expand_path(File.join('../', 'spec_helper'), File.dirname(__FILE__))

# http://azunyan.sitemix.jp/kunkakunka/kunkakunka.php

describe Kunkakunka do
  context '.do' do
    subject { Kunkakunka.do }

      it { should match /^ルイズ！ルイズ！ルイズ！ルイズぅぅうううわぁああああああああああああああああああああああん！！！/ }
  end
end

describe Kunkakunka::Text do
  describe 'when original values,' do
    before do
      @text = Kunkakunka::Text.new
    end

    context '#to_s' do
      subject { @text.to_s }

      it { should match /^ルイズ！ルイズ！ルイズ！ルイズぅぅうううわぁああああああああああああああああああああああん！！！/ }
    end

    context '#template' do
      subject { @text.template }

      it { should match /^%name%！%name%！%name%！%name_with_gasp%/ }
    end
  end

  describe 'when custom values,' do
    before do
      @text = Kunkakunka::Text.new {|t|
        t.name = 'あずさ'
      }
    end

    context '#to_s' do
      subject { @text.to_s }

      it { should match /^あずさ！あずさ！あずさ！あずさぁぁあああわぁああああああああああああああああああああああん！！！/ }
    end

    context '#template' do
      subject { @text.template }

      it { should match /^%name%！%name%！%name%！%name_with_gasp%/ }
    end
  end

  context '.gaspize' do
    it 'given "あかさたな".' do
      Kunkakunka::Text.gaspize("あかさたな").should == 'あかさたなぁぁあああ'
    end

    it 'given "いきしちに".' do
      Kunkakunka::Text.gaspize("いきしちに").should == 'いきしちにぃぃいいい'
    end

    it 'given "うくすつぬ".' do
      Kunkakunka::Text.gaspize("うくすつぬ").should == 'うくすつぬぅぅううう'
    end

    it 'given "えけせてね".' do
      Kunkakunka::Text.gaspize("えけせてね").should == 'えけせてねぇぇえええ'
    end

    it 'given "おこそとの".' do
      Kunkakunka::Text.gaspize("おこそとの").should == 'おこそとのぉぉおおお'
    end
  end

  context '.emphaize' do
    it 'given "ルイズ".' do
      Kunkakunka::Text.emphaize("ルイズ").should == 'ル イ ズ'
    end
  end

  context '.hira_map' do
    it 'return mapping hash.' do
      map = Kunkakunka::Text.hira_map
    end
  end

  context '.kana_map' do
    it 'return mapping hash.' do
      map = Kunkakunka::Text.kana_map
    end
  end
end
