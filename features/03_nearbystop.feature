Feature: NearbyStop
	1.身為使用者，為了知道地點附近有哪些公車與站牌，我可以輸入地名搜尋附近站牌
	2.身為使用者，為了知道所在地附近有哪些公車與站牌，我可以透過定位取得目前地點搜尋附近站牌
	3.身為使用者，為了能快速搜尋已搜尋地點的附近站牌，我可以點選歷史紀錄直接進行搜尋
	4.身為使用者，為了知道地點附近有哪些公車與站牌可以到另一地點，我可以選擇目的站牌
	5.身為使用者，為了得知站牌有哪些公車快進站了，我可以點選站牌查看公車動態
	6.身為使用者，為了保障個人隱私，我可以刪除過去搜尋的歷史紀錄

Background:

@android
Scenario: 輸入地點搜尋附近站牌及公車情況
	Given 我在附近站牌頁面
	And 我進入查詢地名畫面
	Then 我應該可以查詢"台北科技大學"
	When 我選擇"台北市大安區忠孝東路三段台北科技大學"
	Then 我應該可以觀看公車站牌
	When 我選擇"National Taipei University of Technology"站
	Then 我應該可以觀看公車情況

@android
Scenario: 輸入目的站牌搜尋原地點到此地點的公車
	Given 我在附近站牌頁面
	And 我進入查詢地名畫面
	Then 我應該可以查詢"台北科技大學"
	And 我選擇"台北市大安區忠孝東路三段台北科技大學"
	And 我進入選擇目的站牌畫面
	Then 我應該可以輸入目的站牌"Zhengyi Post Office"
	When 我選擇"Zhengyi Post Office"當作目的站牌
	Then 我應該可以觀看公車站牌

@android
Scenario: 輸入地點搜尋後取消輸入
	Given 我在附近站牌頁面
	And 我進入查詢地名畫面
	When 我應該可以查詢"台北科技大學"
	Then 我應該可以取消查詢地名

@android
Scenario: 輸入地點搜尋後會產生歷史紀錄
	Given 我在附近站牌頁面
	And 我進入查詢地名畫面
	When 我應該可以查詢"台北科技大學"
	And 我選擇"台北市大安區忠孝東路三段台北科技大學"
	And 我進入查詢地名畫面
	Then 我應該可以看到"台北市大安區忠孝東路三段台北科技大學"被加進歷史紀錄中

@android
Scenario: 我可以刪除地點搜尋的歷史紀錄
	Given 我在附近站牌頁面
	And 我進入查詢地名畫面
	When 我應該可以查詢"台北科技大學"
	And 我選擇"台北市大安區忠孝東路三段台北科技大學"
	And 我進入查詢地名畫面
	Then 我應該可以看到"台北市大安區忠孝東路三段台北科技大學"被加進歷史紀錄中
	Then 我應該可以刪除歷史紀錄

@android
Scenario: 輸入站牌關鍵字後取消輸入
	Given 我在附近站牌頁面
	And 我進入選擇目的站牌畫面
	When 我應該可以輸入目的站牌"Zhengyi Post Office"
	Then 我應該可以取消輸入目的站牌

@android
Scenario: 輸入站牌關鍵字後會產生歷史紀錄
	Given 我在附近站牌頁面
	And 我進入選擇目的站牌畫面
	When 我應該可以輸入目的站牌"Zhengyi Post Office"
	And 我選擇"Zhengyi Post Office"當作目的站牌
	And 我進入選擇目的站牌畫面
	Then 我應該可以取消輸入目的站牌
	And 我應該可以看到"Zhengyi Post Office"在目的站牌歷史紀錄中

@android
Scenario: 我可以刪除站牌關鍵字的歷史紀錄
	Given 我在附近站牌頁面
	And 我進入選擇目的站牌畫面
	When 我應該可以輸入目的站牌"Zhengyi Post Office"
	And 我選擇"Zhengyi Post Office"當作目的站牌
	And 我進入選擇目的站牌畫面
	Then 我應該可以取消輸入目的站牌
	And 我應該可以看到"Zhengyi Post Office"在目的站牌歷史紀錄中
	And 我應該可以刪除目的站牌歷史紀錄

@android
Scenario: 我可以取消設定目的站牌
	Given 我在附近站牌頁面
	And 我進入選擇目的站牌畫面
	When 我應該可以輸入目的站牌"Zhengyi Post Office"
	And 我選擇"Zhengyi Post Office"當作目的站牌
	And 我進入選擇目的站牌畫面
	Then 我應該可以不設站牌並返回
	And 我應該可以觀看公車站牌

