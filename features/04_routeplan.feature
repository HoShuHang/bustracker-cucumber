Feature: RoutePlan
  1.身為使用者，為了要可以知道抵達時間，我可以輸入起點與終點去計算抵達時間
  2.身為使用者，為了要可以知道抵達目的地的路線，我可以輸入起點與終點去規劃路線
  3.身為使用者，為了要可以知道不同時間出發能夠選擇的路線，我可以變更出發日期與時間
  4.身為使用者，為了可以容易的看到路線，我可以將規劃完的路線用 google map 顯示
  5.身為使用者，為了要更容易的輸入起點或終點，我可以用 google map 拖拉的方式決定起點或終點
  6.身為使用者，為了要更容易的輸入起點或終點，我可以直接使用搜尋的歷史紀錄當作起點或終點
  7.身為使用者，為了要更容易的刪除起點或終點，我可以直接點選按鈕直接將起點或終點刪除
  8.身為使用者，為了要避免將起點終點輸入相反，我可以直接將起點與終點對調
  9.身為使用者，為了要可以選擇偏好的交通工具，我可以勾選偏好的交通工具
  10.身為使用者，為了要可以變更路線規劃依據，我可以選擇要依據哪種路線規劃方式來規劃路線


Background:

@android
Scenario: 我可以得到抵達時間
  Given 我在路線規劃頁面
  When 我輸入"台北科技大學"當作起點
  And 我選擇"台北市大安區忠孝東路三段台北科技大學"做為起點
  When 我輸入"聖約翰科技大學"當作終點
  And 我選擇"新北市淡水區淡金路四段聖約翰科技大學"做為終點
  Then 我應該可以規劃至少一條路線

@android
Scenario: 我可以確認可以正常顯示無法規劃路線
  Given 我在路線規劃頁面
  When 我輸入"台北科技大學"當作起點
  And 我選擇"台北市大安區忠孝東路三段台北科技大學"做為起點
  When 我輸入"菲律賓"當作終點
  And 我選擇"菲律賓"做為終點
  Then 我應該無法規劃路線

@android
Scenario: 我可以得到不是當前時間的規劃路線
  Given 我在路線規劃頁面
  When 我輸入"台北科技大學"當作起點
  And 我選擇"台北市大安區忠孝東路三段台北科技大學"做為起點
  When 我輸入"聖約翰科技大學"當作終點
  And 我選擇"新北市淡水區淡金路四段聖約翰科技大學"做為終點
  When 我可以輸入6時40分當作規劃時間
  Then 我應該可以規劃至少一條路線

@android
Scenario: 我可以使用歷史紀錄規劃路線
  Given 我在路線規劃頁面
  When 我輸入"台北科技大學"當作起點
  And 我選擇"台北市大安區忠孝東路三段台北科技大學"做為起點
  When 我輸入"聖約翰科技大學"當作終點
  And 我選擇"新北市淡水區淡金路四段聖約翰科技大學"做為終點
  When 我可以選擇一條歷史紀錄當作起點
  And 我應該可以選擇"新北市淡水區淡金路四段聖約翰科技大學"做為起點
  When 我可以選擇一條歷史紀錄當作終點
  And 我應該可以選擇"台北市大安區忠孝東路三段台北科技大學"做為終點
  Then 我應該可以規劃至少一條路線

Scenario: 我可以一鍵刪除起點
  Given 我在路線規劃頁面
  When 我可以選擇一條歷史紀錄當作起點
  And 我應該可以選擇"台北市大安區忠孝東路三段台北科技大學"做為起點
  When 我可以選擇起點刪除按鈕
  Then 我的起點會沒有文字

Scenario: 我可以一鍵刪除終點
  Given 我在路線規劃頁面
  When 我可以選擇一條歷史紀錄當作終點
  And 我應該可以選擇"台北市大安區忠孝東路三段台北科技大學"做為起點
  When 我可以選擇起點刪除按鈕
  Then 我的終點會沒有文字

Scenario: 我可以反轉起點與終點
  Given 我在路線規劃頁面
  When 我可以輸入"台北科技大學"當作起點
  And 我應該可以選擇"台北市大安區忠孝東路三段台北科技大學"做為起點
  When 我可以輸入"聖約翰科技大學"當作終點
  And 我應該可以選擇"新北市淡水區淡金路四段聖約翰科技大學"做為終點
  When 我可以點擊按鈕反轉起點與終點
  Then 我可以將起點與終點反轉

Scenario Outline: 我可以得到以不同交通工具為偏好的方式所規劃的路線
  Given 我在路線規劃頁面
  When 我可以輸入"台北科技大學"當作起點
  And 我應該可以選擇"台北市大安區忠孝東路三段台北科技大學"做為起點
  When 我可以輸入"聖約翰科技大學"當作終點
  And 我應該可以選擇"新北市淡水區淡金路四段聖約翰科技大學"做為終點
  When 我可以選擇"選項"
  And 我可以選擇<偏好的交通工具>
  Then 我可以得到至少一條規劃路線

  Examples:
  |偏好的交通工具|
  |公車|
  |捷運|
  |火車|
Scenario Outline: 我可以得到以不同路線為偏好的方式所規劃的路線
  Given 我在路線規劃頁面
  When 我可以輸入"台北科技大學"當作起點
  And 我應該可以選擇"台北市大安區忠孝東路三段台北科技大學"做為起點
  When 我可以輸入"聖約翰科技大學"當作終點
  And 我應該可以選擇"新北市淡水區淡金路四段聖約翰科技大學"做為終點
  When 我可以選擇"選項"
  And 我可以選擇<路線>
  Then 我可以得到至少一條規劃路線

  Examples:
  |路線|
  |最佳路線|
  |轉乘次數較少|
  |步行時間較短|