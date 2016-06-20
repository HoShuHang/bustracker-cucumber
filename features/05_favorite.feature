Feature: Favorite
	1. 身為使用者，為了不用重新搜尋公車站牌與路線，我可以加入常用站牌
	3. 身為使用者，為了分類不同的常用公車站牌，我可以加入常用站牌到新建的站牌群組
	2. 身為使用者，為了不用重新查詢附近站牌的公車路線，我可以將該站牌加入新的站牌群組
	4. 身為使用者，為了可以觀看不同站牌群組的常用站牌，我可以切換目前顯示的站牌群組
	5. 身為使用者，為了方便區分群組，我可以修改站牌群組名稱
	6. 身為使用者，為了使用頻率不同，我可以排序站牌群組
	7. 身為使用者，為了使用頻率不同，我可以排序常用站牌
	8. 身為使用者，為了去掉不用的站牌群組，我可以刪除不常用到的站牌群組
	9. 身為使用者，為了去掉不用的常用站牌，我可以刪除不常用到的常用站牌

Background:

@android
Scenario: 我可以加入常用站牌
	Given 我在路線搜尋頁面
	When 我搜尋"299"路線公車
	And 我進入路線公車頁面
	Then 我應該可以加入"MRT Fu Jen University"站牌到"預設群組"站牌群組

@android
Scenario: 我可以加入常用站牌到新建的站牌群組
	Given 我在路線搜尋頁面
	When 我搜尋"299"路線公車
	And 我進入路線公車頁面
	Then 我應該可以加入"MRT Fu Jen University"站牌到"北科大"站牌群組

@android
Scenario: 我可以將該站牌加入新的站牌群
	Given 我在附近站牌頁面
	When 我選擇"National Taipei U. of Technology"站
	Then 我應該可以將該站牌的全部路線加入"預設群組"站牌群組

@android @have_group
Scenario: 我可以切換目前顯示的站牌群組
	Given 我在常用站牌頁面
	Then 我應該可以切換到"預設群組"站牌群組

@android @have_group
Scenario: 我可以修改站牌群組名稱
	Given 我在常用站牌頁面
	Then 我應該可以更名"預設群組"站牌群組為"HOME"

@android @have_group
Scenario: 我可以排序站牌群組
	Given 我在常用站牌頁面
	Then 我應該可以把"預設群組"站牌群組設成第一個站牌群組

Scenario: 我可以排序常用站牌
	Given 我在常用站牌頁面
	When 我切換到"仁愛敦化路口"站牌群組
	Then 我應該可以把"275"設成該站牌群組的第一個常用站牌

Scenario: 我可以刪除不常用到的站牌群組
	Given 我在常用站牌頁面
	When 我切換到"HOME"站牌群組
	Then 我應該可以刪除"HOME"站牌群組

Scenario: 我可以刪除不常用到的常用站牌
	Given 我在常用站牌頁面
	When 我切換到"仁愛敦化路口"站牌群組
	And 我選擇"275副"常用站牌
	Then 我應該可以從"仁愛敦化路口"站牌群組中刪除"275"常用站牌