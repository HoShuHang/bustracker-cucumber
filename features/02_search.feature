Feature: Search
	身為使用者，為了查詢北市公車路線與到站時間，我可以搜尋公車路線

Background:

Scenario Outline: 我藉由輸入/按鈕搜尋一台數字公車路線
	Given 我在路線搜尋頁面
	When 我藉由<方式>搜尋"299"路線公車
	Then 我應該可以查到所有"299"路線公車

	Examples:
	|方式|
	|輸入|
	|按鈕|

Scenario: 我藉由輸入/按鈕搜尋一台文字公車路線
	Given 我在路線搜尋頁面
	When 我藉由<方式>搜尋"藍1"路線公車
	Then 我應該可以查到所有"藍1"路線公車

	Examples:
	|方式|
	|輸入|
	|按鈕|

Scenario: 我可以查詢去回之目前公車到站狀況
	Given 我在路線搜尋頁面
	When 我搜尋"299"路線公車
	And 我進入路線公車頁面
	Then 我應該可以看到去程公車到站狀況
	And 我應該可以看到回程公車到站狀況

Scenario: 我可以觀看公車詳細資訊
	Given 我在路線搜尋頁面
	When 我搜尋"299"路線公車
	And 我進入路線公車頁面
	Then 我應該可以觀看公車詳細資訊
	When 我回到路線公車頁面
	And 我選擇任一站牌
	Then 我應該可以觀看公車詳細資訊

Scenario: 我藉由輸入/按鈕搜尋一台不存在的公車路線
	Given 我在路線搜尋頁面
	When 我藉由<方式>搜尋"12345"路線公車
	Then 我應該查不到任何"12345"路線公車

	Examples:
	|方式|
	|輸入|
	|按鈕|

Scenario: 輸入公車路線後取消輸入
	Given 我在路線搜尋頁面
	When 我藉由輸入搜尋"299"路線公車
	Then 我應該可以取消輸入

Scenario: 離開路線搜尋頁面在重新進入必須重新搜尋

Scenario: 重設路線搜尋

Scenario: 更改搜尋路線

Scenario: 查詢與該公車經過相同站牌的路線

Scenario: 顯示公車路線地圖

Scenario: 到站報時

Scenario: 上車提醒

@bug
Scenario: 先藉由輸入再藉由按鈕搜尋公車路線

Scenario: 先藉由按鈕再藉由輸入搜尋公車路線