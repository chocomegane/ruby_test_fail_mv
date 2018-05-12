require "fileutils"
project_path = Dir.pwd

# ディレクトリがあるかどうかを判定しなければディレクトリを生成する
# バックアップへ移動させるためのディレクトリを用意する
# ※初期の時または削除された場合に生成される
if !Dir::exist?("bk_box")
  puts "ディレクトリを生成します"
  Dir::mkdir("bk_box")
  puts "ディレクトリを生成しました"
end

# ディレクトリを開く
dir = Dir.open("fail_box")

# ディレクトリ内のファイルを格納するための配列を用意する
failnames = []

# ディレクトリ内のファイル情報を配列に格納していく
target_count = 0
dir.each do |fail|
  next if fail == '.' or fail == '..'
  target_count = target_count + 1
  failnames << fail
end
target_count_str = target_count.to_s
puts "ファイルを"+ target_count_str +"件移動させます"

# ファイルが格納されている場合フォルダ内のファイルを移動させる
move_count = 0
if !failnames.empty?
  failnames.each do |fail|
    move_count = move_count + 1
    move_count_str = move_count.to_s
    puts "ファイルを"+ move_count_str +"件目移動しました"

    # 取得したファイルを一件ずつ移動させる
    # 同じ名前の画像は上書きする
    FileUtils.mv(project_path+"/fail_box/"+fail,project_path+"/bk_box/"+fail)
  end
else
  puts "ファイルが存在しませんでした"
end
puts "処理が完了しました"
