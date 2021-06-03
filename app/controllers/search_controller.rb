class SearchController < ApplicationController

  def search
    @model = params["search"]["model"]
    #選択したmodelを@modelに代入
    @value = params["search"]["value"]
    #検索にかけた文字列(ここではvalue)を@valueに代入
    @how = params["search"]["how"]
    #選択した検索方法howを@howに代入
    @datas = search_for(@how, @model, @value)
    #search_forの引数にインスタンス変数を定義
    #@datasに最終的な検索結果が入ります
  end

  private

  def match(model, value)
  #def search_forでhowがmatchだった場合の処理
    if model == 'user'
  #modelがuserの場合の処理
      User.where(name: value)
  #whereでvalueと完全一致するnameを探します
    elsif model == 'book'
      Book.where(title: value)
    end
  end

  def forward(model, value)
    if model == 'user'
      User.where("name LIKE ?", "#{value}%")
    elsif model == 'book'
      Book.where("title LIKE ?", "#{value}%")
    end
  end

  def backward(model, value)
    if model == 'user'
      User.where("name LIKE ?", "%#{value}")
    elsif model == 'book'
      Book.where("title LIKE ?", "%#{value}")
    end
  end

  def partical(model, value)
    if model == 'user'
      User.where("name LIKE ?", "%#{value}%")
    elsif model == 'book'
      Book.where("title LIKE ?", "%#{value}%")
    end
  end

  def search_for(how, model, value)
  #searchアクションで定義した情報が引数に入っている
    case how
    #検索方法のhowの中身がどれなのかwhenの条件分岐の中から探す処理
    when 'match'
      match(model, value)
    #検索方法の引数に(model, value)を定義している
    #例えばhowがmatchの場合は def match の処理に進みます
    when 'forward'
      forward(model, value)
    when 'backward'
      backward(model, value)
    when 'partical'
      partical(model, value)
    end

  end

end
