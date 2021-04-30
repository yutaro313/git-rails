class TodolistsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数2からのモデルオブジェクトを生成する。
    @list = List.new
  end
  
  def create
    # 1.データを新規登録するためのインスタンス作成
    list = List.new(list_params)
    # 2.データをデータベースに保存するためのsaveメソッド実行
    list.save
    # 3.トップ画面へリダイレクト
    redirect_to todolist_path(list.id)
  end
  
  def index
    @lists = List.all
  end
  
  def show
    @list = List.find(params[:id])
  end
  def edit
    @list = List.find(params[:id])
  end
  def update
     list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)
  end
  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to todolists_path
  end


private
# ストロングパラメータ
def list_params
  params.require(:list).permit(:title, :body, :image)
end
# require 必要とする

end
