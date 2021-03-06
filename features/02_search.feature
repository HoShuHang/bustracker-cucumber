Feature: Search
	1.身為使用者，為了查詢北市公車詳細資訊，我可以搜尋公車路線
	2.身為使用者，為了快速查詢北市公車詳細資訊，我可以用常用站牌快速搜尋公車路線
	3.身為使用者，為了能得知公車進站時間，我可以使用到站報時且可以觀看各站進站狀況
	4.身為使用者，為了區分公車方向，我可以辨別公車去回程路線
	5.身為使用者，為了清楚知道公車路線，我可以在地圖上觀看路線
	6.身為使用者，為了得知是否有其他可以搭乘的公車，我可以查詢經過相同站牌的其他路線


Background:

@android
Scenario Outline: 我藉由輸入/按鈕搜尋一台數字公車路線
	Given 我在路線搜尋頁面
	When 我藉由<方式>搜尋"299"路線公車
	Then 我應該可以查到2筆"299"路線公車

	Examples:
	|方式|
	|輸入|
	|按鈕|

@android
Scenario Outline: 我藉由輸入/按鈕搜尋一台文字公車路線
	Given 我在路線搜尋頁面
	When 我藉由<方式>搜尋"R1"路線公車
	Then 我應該可以查到3筆"R1"路線公車

	Examples:
	|方式|
	|輸入|
	|按鈕|

@android
Scenario: 我可以查詢去回之目前公車到站狀況
	Given 我在路線搜尋頁面
	When 我搜尋"299"路線公車
	And 我進入路線公車頁面
	Then 我應該可以看到去程公車到站狀況
	And 我應該可以看到回程公車到站狀況

@android
Scenario: 我可以觀看公車詳細資訊
	Given 我在路線搜尋頁面
	When 我搜尋"299"路線公車
	And 我進入路線公車頁面
	Then 我應該可以觀看公車詳細資訊
	When 我回到路線公車頁面
	And 我選擇"MRT Fu Jen University Sta."站牌
	Then 我應該可以選擇觀看公車詳細資訊

@android
Scenario Outline: 我藉由輸入/按鈕搜尋一台不存在的公車路線
	Given 我在路線搜尋頁面
	When 我藉由<方式>搜尋"12345"路線公車
	Then 我應該查不到任何"12345"路線公車

	Examples:
	|方式|
	|輸入|
	|按鈕|

@android
Scenario: 輸入公車路線後取消輸入
	Given 我在路線搜尋頁面
	When 我輸入"299"路線公車
	Then 我應該可以取消輸入

@android
Scenario: 離開路線搜尋頁面再重新進入必須重新搜尋
	Given 我在路線搜尋頁面
	When 我搜尋"299"路線公車
	And 我回到首頁
	And 我在路線搜尋頁面
	Then 我應該看不到搜尋過的畫面

@android
Scenario: 重設路線搜尋
	Given 我在路線搜尋頁面
	When 我搜尋"299"路線公車
	Then 我應該可以重設路線搜尋

@android @demo
Scenario: 更改搜尋路線
	Given 我在路線搜尋頁面
	When 我藉由輸入搜尋"299"路線公車
	Then 我應該可以更改搜尋路線

@android
Scenario: 查詢與該公車經過相同站牌的路線
	Given 我在路線搜尋頁面
	When 我搜尋"299"路線公車
	And 我進入路線公車頁面
	Then 我應該可以查詢經過"MRT Fu Jen University Sta."的所有路線

@android
Scenario: 顯示公車路線地圖
	Given 我在路線搜尋頁面
	When 我搜尋"299"路線公車
	And 我進入路線公車頁面
	Then 我應該可以查看公車路線地圖

Scenario: 到站報時
	Given 我在路線搜尋頁面
	When 我搜尋"299"路線公車
	And 我進入路線公車頁面
	And 我選擇"MRT Fu Jen University Sta."站牌
	Then 我應該可以設定到站報時

@android
Scenario: 上車提醒
	Given 我在路線搜尋頁面
	When 我搜尋"299"路線公車
	And 我進入路線公車頁面
	And 我選擇"MRT Fu Jen University Sta."站牌
	Then 我應該可以設定上車提醒

@android
Scenario: 先藉由輸入再藉由按鈕搜尋公車路線
	Given 我在路線搜尋頁面
	When 我藉由輸入搜尋"2"路線公車
	And 我藉由按鈕搜尋"99"路線公車
	Then 我應該可以查到所有"99"路線公車

@bug @android @demo
Scenario: 先藉由按鈕再藉由輸入搜尋公車路線
	Given 我在路線搜尋頁面
	When 我藉由按鈕搜尋"2"路線公車
	And 我藉由輸入搜尋"99"路線公車
	Then 我應該可以查到所有"299"路線公車