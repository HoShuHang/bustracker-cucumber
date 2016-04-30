Feature: Favorite
	身為使用者，為了不用重新搜尋公車站牌與路線，我可以新增常用站牌與路線
	身為使用者，為了分類不同的常用公車站牌，我可以新增常用站牌群組
	身為使用者，為了方便區分群組，我可以修改群組名稱
	身為使用者，為了使用頻率不同，我可以排序常用站牌群組
	身為使用者，為了使用頻率不同，我可以排序常用站牌
	身為使用者，為了去掉不用的群組，我可以刪除不常用到的常用站牌群組
	身為使用者，為了去掉不用的站牌，我可以刪除不常用到的常用站牌

Background:

Scenario: 我可以新增常用站牌
	Given 我在"任何"路線公車頁面
	When 我選擇"任何"站牌
	Then 我應該可以新增站牌到某個常用站牌群組

Scenario: 我可以新增常用站牌群組
	Given 我在"任何"路線公車頁面
	When 我選擇"任何"站牌
	Then 我應該可以新增站牌到某個新新增的常用站牌模組

Scenario: 我可以修改群組名稱
	Given 我在常用站牌頁面
	When 我選擇右上角選單中的群組更名
	Then 我應該可以修改目前觀看的常用站牌模組的名稱

Scenario: 我可以排序常用站牌群組
	Given 我在常用站牌頁面
	When 我選擇右上角選單中的群組排序
	Then 我應該可以排序我所有的常用站牌群組

Scenario: 我可以排序常用站牌
	Given 我在常用站牌頁面
	When 我選擇右上角選單中的常用站牌排序
	Then 我應該可以排序我所有的常用站牌

Scenario: 我可以刪除不常用到的常用站牌群組
	Given 我在常用站牌頁面
	When 我選擇右上角選單中的群組刪除
	Then 我應該可以刪除目前觀看的常用站牌群組

Scenario: 我可以刪除不常用到的常用站牌
	Given 我在常用站牌頁面
	When 我選擇"任何"站牌
	Then 我應該可以從常用群組中刪除該站牌


