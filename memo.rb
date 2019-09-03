puts "ようこそmemoアプリへ！"


#---------------------------------------------------------
# ログイン機能
#---------------------------------------------------------

users = [
	{username: "suzuki", password: "password1", memo: "これはメモです"},
	{username: "tanaka", password: "password2",memo:""}
]

session_user = {}

print "ユーザー名: "
input_username = gets.chomp

print "パスワード: "
input_password = gets.chomp


user_find_flg = 0
users.each do |user|
	if user[:username] == input_username
		user_find_flg = 1
		if user[:password] == input_password
			
			session_user[:username] = user[:username]
			session_user[:password] = user[:password]
			session_user[:memo] = user[:memo]



			50.times { print "-" }
			puts
			puts "ようこそ#{user[:username]}さん！"
			break
		else
			puts "パスワードが間違っています"
			exit
		end
	end
end


if user_find_flg == 0
	puts "ユーザーが見つかりません"
	exit
end


50.times { print "-" }
puts

#---------------------------------------------------------
# メモ機能
#---------------------------------------------------------

def memo_method(session_user)
	print "■■何をしますか？ メモを見る=>1,メモを作成する=>2,メモを削除する=>3"
	puts
	user_move_input = gets.chomp.to_i

	if user_move_input == 1
		print "メモを表示します！"
		puts
		print "memo:#{session_user[:memo]}"
		puts
	end

	if user_move_input == 2
		print "メモを作成してください！"
		puts 
		session_user[:memo] = gets.chomp
		puts
	end

	if user_move_input == 3
		print "メモを削除します！"
		session_user[:memo] = ""
		puts
	end
end


#---------------------------------------------------------
# アプリを実行する
#---------------------------------------------------------

main_flg = true

while main_flg

	memo_method(session_user)

	50.times { print "-" }
	puts
	print "アプリを終了しますか？ 終了しない=>0,終了する=>1"
	puts
	exit_flg = gets.chomp.to_i

	if exit_flg == 1
		main_flg = false
	end
end

print "アプリを終了しました"
puts
