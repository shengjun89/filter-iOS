ios = require "ios-kit"
{SVGLayer} = require "SVGLayer"
bg = new BackgroundLayer
	backgroundColor: "f5f5f5"

#initial
lists = []
listHeight = 252
amounts = 8
sheetHeight = Screen.height/3
prgs = []

# 底部导航
tabBar = new Layer
	width: Screen.width
	height: 98
	y: Screen.height-98
	z: 6
	backgroundColor: "#fff"
tabBar.style.boxShadow = "0 -1px 0px rgba(0,0,0,0.2)"

tabBar.states.add
	on:
		y: Screen.height
		opacity: 0
	off:
		y: Screen.height-98	
		opacity: 1
tabBar.states.animationOptions = curve: "cubic-bezier(0.23, 1, 0.32, 1)"
#view.hompage
view_homepage = new Layer
	width: Screen.width
	height: Screen.height
	backgroundColor: null
	visible: true
	
view_homepage.states.add
	active:
		visible:true
	inactive:
		visible:false

home = new Layer
	width: Screen.width
	superLayer:view_homepage
	height: 2982
	image: "images/home.png"
	y: Align.top
	z: 2
	opacity: 1
	backgroundColor: "#F5F5F5"
	
	


scrollHome = ScrollComponent.wrap(home)
scrollHome.scrollHorizontal = false
scrollHome.z = 2
scrollHome.superLayer = view_homepage
#SVG loading
nb = new Layer
	parent: view_homepage
	backgroundColor: null
	x: Align.center(40)
	y:0
	width: 300
	height: 160
	originX: 0.5
	originY: 0
	scale: 1.2

# n = new SVGLayer
#   parent:nb
#   strokeWidth: 1
#   width: 40
#   height: 60
#   x: Align.left(20)
#   y: Align.center()
#   z: 1
#   scale: 1.5
#   stroke:"#212121"
#   path: '<path></path>'

#login
loginBtn = new Layer
	superLayer:view_homepage
	z: 3
	width: 200
	height: 56
	x: Align.right(18)
	y: Align.top(52)
	image: "images/Login01.png"	
	opacity: 1
	scale: 0.5

loginBtnActive = new Layer
	superLayer:view_homepage
	z: 3
	width: 200
	height: 56
	x: Align.right(18)
	y: Align.top(52)
	image: "images/Login02.png"	
	scale: 0.5
	opacity: 0

	
loginBtnBg = new Layer
	superLayer:view_homepage
	z: 2
	width: 140
	height: 48
	borderRadius:24	
	x: Align.right(-12)
	y: Align.top(56)
	originX: 1
	originY: 0.5
	backgroundColor:"#000"	
	opacity: 0.4
loginBtnBg.style.boxShadow = "0 1px 0px rgba(0,0,0,0.2)"

statusName = new Layer
	superLayer:view_homepage
	z: 2
	width: 190
	height: 48
	html: "<span style='color:#212121;font-size:40px;'>诺诺镑客</span>"
	backgroundColor: null
	x: Align.center(20)
	y: Align.top(64)
	opacity: 0

#header
statusBar = new Animation
	layer: loginBtnBg
	properties: 
		width: 750
		height: 128
		borderRadius: 0
		x: Align.left
		y: Align.top
		backgroundColor: "#FFF"
		opacity: 1
	curve:"spring(1200,12,0)" 
	time: 0.2
	
loginBtnAnimate = new Animation
	layer: loginBtn
	properties:
		opacity:0	
	curve:"spring(1200,20,0)" 
	time: 0.2
loginBtnAnimateBack = loginBtnAnimate.reverse()

loginBtnAnimate1 = new Animation
	layer: loginBtnActive
	properties:
		opacity:1	
	curve:"spring(1200,20,0)" 
	time: 0.2
loginBtnAnimateBack1 = loginBtnAnimate1.reverse()
			
statusBarback = statusBar.reverse()		

#Action
scrollHome.on Events.Move, ->
	if scrollHome.content.y < -200
		statusBar.start()
		loginBtnAnimate.start()
		loginBtnAnimate1.start()
	else
		statusBarback.start()
		loginBtnAnimateBack.start()
		loginBtnAnimateBack1.start()
			
scrollHome.on Events.Move, ->
	scrolltoY_home(scrollHome.scrollY)
scrolltoY_home = (y) ->
		statusName.opacity = Utils.modulate(y,[200,240],[0,1],true)
		
		
#view.find
view_find = new Layer
	width: Screen.width
	height: Screen.height
	backgroundColor: null
	visible: false	
view_find.states.add
	active:
		visible:true
	inactive:
		visible:false	
#view.mine
view_mine = new Layer
	width: Screen.width
	height: Screen.height
	backgroundColor: null
	visible: false	
view_mine.states.add
	active:
		visible:true
	inactive:
		visible:false
		
contentMine = new Layer
	parent: view_mine
	width: Screen.width
	height: 1637
	image: "images/content1.png"
	
headerBg = new Layer
	parent: view_mine
	width: Screen.width
	height: 392
	backgroundColor: "#2196F3"
	y: 0

sum = new Layer
	parent: headerBg
	html: "<span style='font-size:96px;color:#FFF;line-height:1.4;'>10063.00</span>"	
	width: 400
	height: 124
	x: Screen.width/2-180
	y: 150
	superLayer: fnBg
	z: 1
	backgroundColor: null
	originX: 0.5
	originY: 0.5


# lv = new Layer
# 	width: 46
# 	height: 34
# 	image: "images/lv.png"
# 	y: 70
# 	x: 40
# 	z: 3
# lv.placeBefore(headerBg)
info = new Layer
	superLayer:sum
	width: 48
	height: 48
	image: "images/info.png"
	y: 64
	x: 240
	visible: false	
	
sumtxt = new Layer
	superLayer: headerBg
	html: "<span style='font-size:24px;color:#FFF;line-height:1.4;'>总资产(元)</span>"
	width: 200
	height: 124
	x: Screen.width/2-60
	y: 130
	z: 1
	backgroundColor: null	
	
eyeOff = new Layer
	superLayer:sumtxt
	width: 48
	height: 48
	image: "images/eyeOff.png"
	y: -6
	x: 140
	
header = new Layer
	parent: view_mine
	width: Screen.width
	height: 88
	image: "images/headerbg.png"
	y: 40
	
kf = new Layer
	parent: view_mine
	width: 246
	height: 88
	image: "images/kf.png"
	x: Screen.width/2-123
	y: 1100
	scale: 0
	opacity: 0	

scrollMine =  ScrollComponent.wrap(contentMine)
scrollMine.scrollHorizontal = false
scrollMine.contentInset = {top:0}
scrollMine.y = 456
scrollMine.parent = view_mine	
# scroll.speedY = 0.8

scrollMine.content.draggable.bounceOptions =
	friction: 28,
	tension: 600,
	tolerance: 0.01

radius = 20
stroke = 2
viewBox = (radius*2)+stroke


circle = new Layer
	parent: view_mine
	width: viewBox
	height: viewBox
	backgroundColor: ''
	rotation: -90
	y: 64
circle.pathLength = 2*Math.PI*radius
circle.html = """
  <svg viewBox='-#{stroke/2} -#{stroke/2} #{viewBox} #{viewBox}'>
    <circle fill='none' stroke='#ffffff' stroke-linecap = 'round'
      stroke-width      = '#{stroke}'
      stroke-dasharray  = '#{circle.pathLength}'
      stroke-dashoffset = '0'
      cx = '#{radius}'
      cy = '#{radius}'
      r  = '#{radius}'>
  </svg>"""	
circle.centerX() 
Utils.domComplete ->
 	circle.path = document.querySelector('svg circle')
 	
circle.visible = false

fnBg = new Layer
	parent: view_mine
	width: Screen.width-32
	x: 16
	y: 310
	height: 128
	borderRadius: 8
	backgroundColor: "#FFF"	
	
fnBg.style.boxShadow = "0 4px 12px rgba(217,229,243,1)"

line = new Layer
	superLayer: fnBg
	width: 2
	height: 96
	x: Screen.width/2-14
	y: 16
	backgroundColor: "#979797"
	opacity: 0.12
	
# line1 = new Layer
# 	superLayer: fnBg
# 	width: 2
# 	height: 96
# 	x: Screen.width*2/3-8
# 	y: 16
# 	backgroundColor: "#979797"
# 	opacity: 0.12	
# line1.x = Screen.width*2/3+8
	
# arrow_copy.opacity = 0

icon1 = new Layer
	width: 64
	height: 64
	y: 12
	superLayer: fnBg
	backgroundColor: null
	image: "images/icon_hc.png"
	x: Screen.width/4-24
	originX: 0.5
	originY: 0.5
	
icon2 = new Layer
	width: 64
	height: 64
	y: 12
	superLayer: fnBg
	backgroundColor: null
	image: "images/icon_jy.png"
	x: Screen.width*3/4-54
	originX: 0.5
	originY: 0.5

icon3 = new Layer
	width: 64
	height: 64
	y: 64
	superLayer: fnBg
	backgroundColor: null
	image: "images/icon_hc.png"
	x: 24
	originX: 0.5
	originY: 0.5
	scale: 0.8
	opacity: 0
	
icon4 = new Layer
	width: 64
	height: 64
	y: 64
	superLayer: fnBg
	backgroundColor: null
	image: "images/icon_jy.png"
	x: Screen.width*3/4-168
	originX: 0.5
	originY: 0.5
	scale: 0.8
	opacity: 0			
# icon3 = new Layer
# 	width: 64
# 	height: 64
# 	y: 12
# 	superLayer: fnBg
# 	backgroundColor: null
# 	image: "images/icon_yh.png"
# 	x: Screen.width*2/3+72	
# 	originX: 0
# 	originY: 0.5
	
text1 = new Layer
	html: "<span style='font-size:24px;color:#2196F3;line-height:1.4;'>回款日历</span>"	
	width: 120
	x: 148
	y: 84
	superLayer: fnBg
	z: 1
	backgroundColor: null
	originX: 1.2
	
text2 = new Layer
	html: "<span style='font-size:24px;color:#2196F3;line-height:1.4;'>交易记录</span>"	
	width: 120
	x: Screen.width*3/4-68
	y: 84
	originX:0
	superLayer: fnBg
	z: 1
	backgroundColor: null	
	
# text3 = new Layer
# 	html: "<span style='font-size:24px;color:#2196F3;line-height:1.4;'>银行卡</span>"	
# 	width: 120
# 	x: Screen.width*2/3+70
# 	y: 84
# 	superLayer: fnBg
# 	z: 1
# 	backgroundColor: null	

scrollMine.on Events.Move, ->
	scrollMinetoY(scrollMine.scrollY)
	circle.visible = true
	
scrollMinetoY = (y) ->
	offset = Utils.modulate(y, [0, -96],[circle.pathLength, 0],true)
	circle.path.setAttribute 'stroke-dashoffset', offset
	fnBg.y = Utils.modulate(y,[0,182],[310,128],true)
	text1.y = Utils.modulate(y,[30,160],[84,38],true)
# 	text1.x = Utils.modulate(y,[0,40],[72,100],true)
	text1.scale = Utils.modulate(y,[0,160],[1,1.2],true)		
	icon1.x = Utils.modulate(y,[0,40],[Screen.width/4-24,Screen.width/4-24],true)
	icon1.opacity = Utils.modulate(y,[0,40],[1,0],true)
	icon3.opacity = Utils.modulate(y,[32,110],[0,1],true)
	icon3.y = Utils.modulate(y,[0,160],[80,12],true)	
	icon4.opacity = Utils.modulate(y,[32,110],[0,1],true)
	icon4.y = Utils.modulate(y,[0,160],[80,13],true)
	text2.y = Utils.modulate(y,[30,160],[84,38],true)
# 	text2.x = Utils.modulate(y,[0,40],[Screen.width/2-60,Screen.width/2-30],true)
	text2.scale = Utils.modulate(y,[0,160],[1,1.2],true)
	icon2.x = Utils.modulate(y,[0,40],[Screen.width*3/4-54,Screen.width*3/4-54],true)
	icon2.opacity = Utils.modulate(y,[0,40],[1,0],true)
	line.x = Utils.modulate(y,[0,20],[Screen.width/2-14,Screen.width/2],true)

# 	text3.y = Utils.modulate(y,[0,40],[84,38],true)
# 	text3.x = Utils.modulate(y,[0,40],[Screen.width*2/3+66,Screen.width*2/3+116],true)
# 	text3.scale = Utils.modulate(y,[0,40],[1,1.2],true)
# 	icon3.x = Utils.modulate(y,[0,40],[Screen.width*2/3+70,Screen.width*2/3+42],true)
# 	icon3.scale = Utils.modulate(y,[0,40],[1,0.8],true)

	headerBg.height = Utils.modulate(y,[-200,182],[592,128],true)
	fnBg.height = Utils.modulate(y,[0,182],[128,96],true)
	fnBg.borderRadius = Utils.modulate(y,[0,182],[8,0],true)	
	fnBg.width = Utils.modulate(y,[0,182],[Screen.width-32,Screen.width],true)
	fnBg.x = Utils.modulate(y,[0,182],[16,0],true)
	fnBg.y = Utils.modulate(y,[-500,172],[802,130],true)	
	sumtxt.y = Utils.modulate(y,[-200,182],[230,32],true)
	sumtxt.scale = Utils.modulate(y,[0,182],[1,0.8],true)
	sum.y = Utils.modulate(y,[-200,182],[300,32],true)
	sum.x = Utils.modulate(y,[0,182],[Screen.width/2-180,Screen.width/2-200],true)
	sum.scale = Utils.modulate(y,[0,182],[1,0.4],true)
	info.opacity = Utils.modulate(y,[0,182],[1,0],true)
	eyeOff.opacity = Utils.modulate(y,[0,182],[1,0],true)
	kf.scale = Utils.modulate(y,[200,240],[0,1],true)
	kf.y = Utils.modulate(y,[200,240],[1200,1100],true)
	kf.opacity = Utils.modulate(y,[220,240],[0,1],true)
	scroll.y = Utils.modulate(y,[0,172],[446,228],true)



			
#view.invest

view_invest = new Layer
	width: Screen.width
	height: Screen.height
	backgroundColor: null
	visible: false

# view_invest.on Events.TouchStart,->
# 	print "hello"
	
view_invest.states.add
	active:
		visible:true
	inactive:
		visible:false

content1 = new Layer
	superLayer: view_invest
	width: Screen.width
	height:(listHeight+8)*amounts+400
	backgroundColor: null
scrollInvest = ScrollComponent.wrap(content1)
scrollInvest.parent = view_invest
scrollInvest.scrollHorizontal = false
scrollInvest.speedY = 0.5
scrollInvest.content.placeBehind(tabBar)
tabBar.placeBefore(view_invest)

scrollInvest.on Events.Move, ->
	scrollInvesttoY(scrollInvest.scrollY)

scrollInvesttoY = (y) ->
	for i in [amounts-4...amounts]
		scrollInvest.content.children[0].children[i].children[9].width = 0
		scrollInvest.content.children[1].children[i].children[9].width = 0
		scrollInvest.content.children[2].children[i].children[9].width = 0
		
		scrollInvest.content.children[0].children[i].children[9].width = Utils.modulate(y,[252*i-917,252*(i+1)-917],[0,358],true)
		scrollInvest.content.children[1].children[i].children[9].width = Utils.modulate(y,[252*i-917,252*(i+1)-917],[0,358],true)
		scroll.content.children[2].children[i].children[9].width = Utils.modulate(y,[252*i-917,252*(i+1)-917],[0,358],true)
	for i in [0...amounts-4]
			#if y<152
		scroll.content.children[0].children[i].children[9].width = Utils.modulate(y,[252*i+120,252*(i+1)+120],[358,0],true)
		scroll.content.children[1].children[i].children[9].width = Utils.modulate(y,[252*i,252*(i+1)],[358,0],true)
		scroll.content.children[2].children[i].children[9].width = Utils.modulate(y,[252*i,252*(i+1)],[358,0],true)

fab = new Layer
	superLayer: view_invest
	width: 112
	height: 112
	z: 5
	x: Align.right(-32)
	y: Align.bottom
	image : "images/fab@2x.png"
	opacity: 0
	visible: false
fab.placeBefore(NavBar)

fab.states.add
	on:
		opacity: 0
		y: Align.bottom
	off:
		opacity: 1
		y: Align.bottom(-130)

fab.states.animationOptions = curve: "spring(500,30,0)"

# fabFadeout = new Animation
# 	layer: fab
# 	properties:
# 		opacity:0
# 		y: Align.bottom
# 	time:0.2		
# 	curve: "ease"	
# 
# fabFadein = fabFadeout.reverse()

# fab.onAnimationEnd ->
# 	fabFadein.start()	

scroll.content.draggable.on Events.DragStart, ->
# scroll.onMove ->
	fab.states.switch("on")	
# 	fabFadeout.start()
	
scroll.content.draggable.on Events.DragEnd, ->
# 	fabFadein.start()
# 	else
	Utils.delay 1.2, ->
		fab.states.switch("off")					

overlayer = new Layer
	superLayer: view_invest
	width: Screen.width
	height: Screen.height
	backgroundColor: "#616161"
	z: 7
	opacity: 0
	
overlayer.states.add
	on:
		opacity: 0.8
	off:
		opacity: 0		
overlayer.states.animationOptions = curve: "ease"

bottomSheet = new Layer
	superLayer: view_invest
	width: Screen.width
	height: Screen.height/3
	y: Align.bottom(sheetHeight)
	z: 8
	backgroundColor: "#FFF"

bottomSheet.states.add
	on:
		y: Align.bottom(0)
	off:
		y: Align.bottom(sheetHeight)
bottomSheet.states.animationOptions = curve: "cubic-bezier(0.23, 1, 0.32, 1)"	

fab.on Events.TouchStart, ->
	overlayer.states.switch("on",time:0.2)
	tabBar.states.switch("on",time:0.2)
	bottomSheet.states.switch("on",time:0.2)
	
button = new Layer
	superLayer: bottomSheet
	width: Screen.width
	height: 156
	y: Align.top(sheetHeight-156)
	z: 9	
	image: "images/button.png"	
	
button.on Events.TouchStart, ->
	overlayer.states.switch("off",time:0.2)
	tabBar.states.switch("off",time:0.2)
	bottomSheet.states.switch("off",time:0.2)	
	
slider = new SliderComponent
	min: 0
	max: 100
	value: 50
	knobSize: 40
	height: 3
	width : Screen.width-120
	backgroundColor: "#2196F3"
slider.superLayer = bottomSheet		
slider.fill.backgroundColor = "#e0e0e0"
slider.fill.height = 1
slider.x = Align.center
slider.y = Align.center(-120)

# slider.onValueChange ->
# 	print slider.value	
	
# tab1
Bottom_tab1_txt = new Layer
	width: Screen.width/4
	height: 98
	superLayer: tabBar
	backgroundColor: null
	html: "<span style='font-size:20px;color:#2196F3;padding:73px;line-height:8.2'>首页</span>"

Bottom_tab1 = new Layer
	superLayer: Bottom_tab1_txt
	height: 196
	image:"images/bottom_icon1_sel.png"
	scale: 0.35
	y: Align.top(-60)
	x: Align.left(-6)
	
# tab2	
Bottom_tab2_txt = new Layer
	width: Screen.width/4
	height: 98
	x: Align.left(Screen.width/4)
	superLayer: tabBar
	backgroundColor: null
	html: "<span style='font-size:20px;color:#616161;padding:73px;line-height:8.2'>投资</span>"

Bottom_tab2 = new Layer
	superLayer: Bottom_tab2_txt
	height: 196
	image: "images/bottom_icon2_nor.png"
	scale: 0.35
	y: Align.top(-60)
	x: Align.left(-6)	
	
# tab3	
Bottom_tab3_txt = new Layer
	width: Screen.width/4
	height: 98
	x: Align.left(Screen.width/2)
	superLayer: tabBar
	backgroundColor: null
	html: "<span style='font-size:20px;color:#616161;padding:73px;line-height:8.2'>发现</span>"

Bottom_tab3 = new Layer
	superLayer: Bottom_tab3_txt
	height: 196
	image: "images/bottom_icon3_nor.png"
	scale: 0.35
	y: Align.top(-60)
	x: Align.left(-6)	
	
# tab4
Bottom_tab4_txt = new Layer
	width: Screen.width/4
	height: 98
	x: Align.left(Screen.width*3/4)
	superLayer: tabBar
	backgroundColor: null
	html: "<span style='font-size:20px;color:#616161;padding:73px;line-height:8.2'>我的</span>"

Bottom_tab4 = new Layer
	superLayer: Bottom_tab4_txt
	height: 196
	image: "images/bottom_icon4_nor.png"
	scale: 0.35
	y: Align.top(-60)
	x: Align.left(-6)		

Bottom_tab1_txt.states.add
	active:
		html: "<span style='font-size:20px;color:#2196F3;padding:73px;line-height:8.2'>首页</span>"
	inactive:
		html: "<span style='font-size:20px;color:#919191;padding:73px;line-height:8.2'>首页</span>"
			
Bottom_tab1.states.add
	active:	
		image: "images/bottom_icon1_sel.png"	
	inactive:	
		image: "images/bottom_icon1_nor.png"	

Bottom_tab2_txt.states.add
	active:
		html: "<span style='font-size:20px;color:#2196F3;padding:73px;line-height:8.2'>投资</span>"
	inactive:
		html: "<span style='font-size:20px;color:#919191;padding:73px;line-height:8.2'>投资</span>"
			
Bottom_tab2.states.add
	active:	
		image: "images/bottom_icon2_sel.png"	
	inactive:	
		image: "images/bottom_icon2_nor.png"
		
Bottom_tab3_txt.states.add
	active:
		html: "<span style='font-size:20px;color:#2196F3;padding:73px;line-height:8.2'>发现</span>"
	inactive:
		html: "<span style='font-size:20px;color:#919191;padding:73px;line-height:8.2'>发现</span>"
			
Bottom_tab3.states.add
	active:	
		image: "images/bottom_icon3_sel.png"	
	inactive:	
		image: "images/bottom_icon3_nor.png"				
		
Bottom_tab4_txt.states.add
	active:
		html: "<span style='font-size:20px;color:#2196F3;padding:73px;line-height:8.2'>我的</span>"
	inactive:
		html: "<span style='font-size:20px;color:#919191;padding:73px;line-height:8.2'>我的</span>"
			
Bottom_tab4.states.add
	active:	
		image: "images/bottom_icon4_sel.png"	
	inactive:	
		image: "images/bottom_icon4_nor.png"



Bottom_tab1_txt.on Events.TouchStart, ->
	Bottom_tab1_txt.states.switch("active")
	Bottom_tab1.states.switch("active")
	view_homepage.states.switch("active")
	view_invest.states.switch("inactive")
	view_find.states.switch("inactive")
	view_mine.states.switch("inactive")
	Bottom_tab2_txt.states.switch("inactive")
	Bottom_tab2.states.switch("inactive")
	Bottom_tab3_txt.states.switch("inactive")
	Bottom_tab3.states.switch("inactive")
	Bottom_tab4_txt.states.switch("inactive")
	Bottom_tab4.states.switch("inactive")

Bottom_tab2_txt.on Events.TouchStart, ->
	Bottom_tab2_txt.states.switch("active")
	Bottom_tab2.states.switch("active")
	view_homepage.states.switch("inactive")
	view_invest.states.switch("active")
	view_find.states.switch("inactive")
	view_mine.states.switch("inactive")
	Bottom_tab1_txt.states.switch("inactive")
	Bottom_tab1.states.switch("inactive")
	Bottom_tab3_txt.states.switch("inactive")
	Bottom_tab3.states.switch("inactive")
	Bottom_tab4_txt.states.switch("inactive")
	Bottom_tab4.states.switch("inactive")
	
Bottom_tab3_txt.on Events.TouchStart, ->
	Bottom_tab3_txt.states.switch("active")
	Bottom_tab3.states.switch("active")
	view_homepage.states.switch("inactive")
	view_invest.states.switch("inactive")
	view_find.states.switch("active")
	view_mine.states.switch("inactive")
	Bottom_tab1_txt.states.switch("inactive")
	Bottom_tab1.states.switch("inactive")
	Bottom_tab2_txt.states.switch("inactive")
	Bottom_tab2.states.switch("inactive")
	Bottom_tab4_txt.states.switch("inactive")
	Bottom_tab4.states.switch("inactive")	
	
Bottom_tab4_txt.on Events.TouchStart, ->
	Bottom_tab4_txt.states.switch("active")
	Bottom_tab4.states.switch("active")
	view_homepage.states.switch("inactive")
	view_invest.states.switch("inactive")
	view_find.states.switch("inactive")
	view_mine.states.switch("active")
	Bottom_tab1_txt.states.switch("inactive")
	Bottom_tab1.states.switch("inactive")
	Bottom_tab2_txt.states.switch("inactive")
	Bottom_tab2.states.switch("inactive")
	Bottom_tab3_txt.states.switch("inactive")
	Bottom_tab3.states.switch("inactive")	
		
# invest_list
	
for i in [0...amounts]
	investList = new Layer
		superLayer: content1
		width: Screen.width
		backgroundColor : "#fff"
		height: listHeight
		y:(listHeight+8)*i+216
	lists.push(investList)	
	
	listName = new Layer
		superLayer: investList
		width: Screen.width/3
		height: 96
		html: "<span style='font-size:32px;color:#212121;padding:16px 32px;line-height:3'>应急周转</span>"
		backgroundColor: null
	listName.constraints = {top:4,leading:0,trailing:Screen.width/3}
	list_pft = new Layer
		superLayer: investList
		html: "<span style='font-size:45px;overflow:hidden;line-height:1.2;color:#E74C3C;font-weight:500;padding-left:28px;'>10.9-11.0</span>"
		backgroundColor: null
		width: Screen.width/3
		height: 80
	list_pft.constraints = {top:listName,leading:0,trailing:Screen.width/3}
	
	list_sub1 = new Layer
		superLayer: investList
		html: "<span style='font-size:24px;overflow:hidden;line-height:1.8;color:#9e9e9e;padding-left:28px;'>预期年华利率(%)</span>"
		backgroundColor: null
		width: Screen.width/3
		height: 44
	list_sub1.constraints = {top:list_pft,leading:0,trailing:Screen.width/3}
	
	line = new Layer
		superLayer: investList
		width: 1
		height: 110
		backgroundColor: "#e0e0e0"
	line.constraints = {top:listName,leading:list_pft,trailing:Screen.width/3+1}	
	list_time = new Layer
		superLayer: investList
		html: "<span style='font-size:28px;overflow:hidden;line-height:1.8;color:#212121;padding-left:0px;'>期限3个月</span>"
		backgroundColor: null
		width: Screen.width/3
		height: 48
	list_time.constraints = {top:listName,leading:[line,16],trailing:0}
	
	prgBarBg = new Layer
		superLayer: investList
		backgroundColor:"#e0e0e0"
		height: 3
		width: Screen.width/2
	prgBarBg.constraints = {top:[list_time,8],leading:[line,16],trailing:56}
	
	list_sub2 = new Layer
		superLayer: investList
		html: "<span style='font-size:24px;overflow:hidden;line-height:1.8;color:#616161;padding-left:0px;'>剩余可投 30000元</span>"
		backgroundColor: null
# 		width: Screen.width/3
		height: 44
	list_sub2.constraints = {top:list_pft,trailing:8}	
	list_sub3 = new Layer
		superLayer: investList
		html: "<span style='font-size:24px;overflow:hidden;line-height:1.8;color:#616161;padding-left:28px;text-align:right;'>起投1000元</span>"
		backgroundColor: null
		width: Screen.width/3
		height: 44
	list_sub3.constraints = {top:list_pft,leading:line,trailing:12}
	
	prgValue = new Layer
		superLayer: investList
		html: "<span style='font-size:24px;overflow:hidden;line-height:1.2;color:#2189F3;padding-left:28px;'>100%</span>"
		backgroundColor: null
		width: 375
		height: 30
		x: 636
		y: 154
		
	prgBar = new Layer
		superLayer: investList
# 		backgroundColor:"#e0e0e0"
		image: "images/pgsBar.png"
		height: 3
		width: 0
		x: 280
		y: 168
	prgBar.constraints = {top:[list_time,8],leading:[line,16],trailing:56}
	
# print prgs	
#-54  1078		
# animationA.start()
NavBar = new Layer
	superLayer: view_invest
	backgroundColor: "#FFF"
	width: Screen.width
	height: 128
	z:5
NavBar.constraints =
	top:0
	leading:0
	trailing:0
NavBar.style.boxShadow = "0 1px 0 rgba(0,0,0,0.12)"	
ios.layout.set()

tipBg = new Layer
	backgroundColor: "#FFF9EE"
	height: 88
# 	image: "images/tip.jpg"	
tipBg.constraints =
	top:[NavBar,2]
	leading:0,trailing:0
ios.layout.set()	

	
tipBg.parent = content1
tipBg.style.boxShadow = "0 1px 0px rgba(150,54,95,0.12)"

tip_txt = new Layer
	superLayer: tipBg
	html: "<span style='font-size:26px;padding:14px 32px;overflow:hidden;line-height:1.4;color:#FD8608'>投资特色 : 持有越长，收益越高。</span>"	
	backgroundColor: null
	width: Screen.width
	height:40
	x: Align.left
	y: Align.top(24)


#添加其他Tab项内容
content2 = content1.copy()
content2.parent = scroll.content
content2.x = Screen.width

content3 = content2.copy()
content3.parent = scroll.content
content3.x = Screen.width*2


content1.states.add
	dt:
		x:0
	zt:
		x:-Screen.width
	zz:
		x:-Screen.width*2
content1.states.animationOptions = curve: "spring(200.1.0)"

content2.states.add
	dt:
		x:Screen.width
	zt:
		x:0
	zz:
		x:-Screen.width
content2.states.animationOptions = curve: "spring(200.1.0)"

content3.states.add
	dt:
		x:Screen.width*2
	zt:
		x:Screen.width
	zz:
		x:0
content3.states.animationOptions = curve: "spring(200.1.0)"		

scroll.content.children[1].children[amounts].children[0].html = "<span style='font-size:26px;padding:14px 32px;overflow:hidden;line-height:1.4;color:#FD8608'>投资特色 : 期限短，收益快。</span>"

scroll.content.children[2].children[amounts].children[0].html = "<span style='font-size:26px;padding:14px 32px;overflow:hidden;line-height:1.4;color:#FD8608'>投资特色 : 二级市场，灵活买卖。</span>"

for i in [0...amounts]
	scroll.content.children[1].children[i].children[0].html = "<span style='font-size:32px;color:#212121;padding:16px 32px;line-height:3'>诺诺盈</span>"
	scroll.content.children[2].children[i].children[0].html = "<span style='font-size:32px;color:#212121;padding:16px 32px;line-height:3'>急用钱</span>"
# 	scroll.content.children[1].children[i].children[9].width = 0

# TAB下划线
underLine = new Layer
	superLayer: NavBar
	backgroundColor: "#2196F3"
	height: 6
	width: Screen.width/3-80
	y: 124
	x:Align.left(36)

underLine.states.add
	dt:
		x: Align.left(36)
	zt:
		x: Align.center
	zz:
		x: Align.right(-36)	
underLine.states.animationOptions =  curve: "spring(400,24,0)"


		
# TAB名称	
tab1 = new Layer
	width:Screen.width/3
	superLayer: NavBar
	html: "<span style='font-size:34px;color:#2196F3;padding:86px;line-height:4.5'>定投</span>"
	height: 128
	backgroundColor: null

tab1.states.add
	on:
		html:"<span style='font-size:34px;color:#2196F3;padding:86px;line-height:4.5'>定投</span>"
	off:
		html:"<span style='font-size:34px;color:#616161;padding:86px;line-height:4.5'>定投</span>"


tab2 = new Layer
	width:Screen.width/3
	x: Align.center
	superLayer: NavBar
	html: "<span style='font-size:34px;color:#616161;padding:86px;line-height:4.5'>直投</span>"
	height: 128
	backgroundColor: null
tab2.states.add
	on:	
		html: "<span style='font-size:34px;color:#2196F3;padding:86px;line-height:4.5'>直投</span>"
	off:	
		html: "<span style='font-size:34px;color:#616161;padding:86px;line-height:4.5'>直投</span>"	
		
tab3 = new Layer
	width:Screen.width/3
	x: Align.right
	superLayer: NavBar
	html: "<span style='font-size:34px;color:#616161;padding:86px;line-height:4.5'>债转</span>"
	height: 128
	backgroundColor: null
tab3.states.add
	on:	
		html: "<span style='font-size:34px;color:#2196F3;padding:86px;line-height:4.5'>债转</span>"
	off:	
		html: "<span style='font-size:34px;color:#616161;padding:86px;line-height:4.5'>债转</span>"	


# TAB交互行为
tab1.on Events.TouchStart, ->
	tab1.states.switch("on")
	tab2.states.switch("off")
	tab3.states.switch("off")
	underLine.states.switch("dt")
	content1.states.switch("dt")
	content2.states.switch("dt")
	content3.states.switch("dt")
	fab.states.switch("on")
	Utils.delay 0.2, ->
		fab.visible = false
# 	for i in [0...amounts]
# 		animate[i].start()

tab2.on Events.TouchStart, ->
	tab1.states.switch("off")
	tab2.states.switch("on")
	tab3.states.switch("off")
	underLine.states.switch("zt")
	content1.states.switch("zt")
	content2.states.switch("zt")
	content3.states.switch("zt")
	fab.states.switch("off")
	fab.visible = true
	
tab3.on Events.TouchStart, ->
	tab1.states.switch("off")
	tab2.states.switch("off")
	tab3.states.switch("on")
	underLine.states.switch("zz")
	content1.states.switch("zz")
	content2.states.switch("zz")
	content3.states.switch("zz")
	fab.states.switch("off")
	fab.visible = true
# 	for i in [0...amounts]
# 		animate[i].start()