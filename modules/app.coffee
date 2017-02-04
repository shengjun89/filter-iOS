# Import file "SVG"
sketch = Framer.Importer.load("imported/SVG@1x")

# Set background color
Screen.backgroundColor = "#fff"

# Tabs  initial
TabA = new Layer
TabA.html ="<span style='color:#515151;font-size:36px'>Moments</span>"
TabA.x = 100
TabA.y = 64

TabB = new Layer
TabB.backgroundColor = "transparent"
TabB.html ="<span style='color:#515151;font-size:36px'>MyFavorites</span>"
TabB.x = 440
TabB.y = 64
TabB.opacity = 0
TabA.backgroundColor = "transparent"

#make ScrollComponent
scroll1 = ScrollComponent.wrap(sketch.Moments_Copy)
scroll1.scrollHorizontal = false	
scroll2 = ScrollComponent.wrap(sketch.Favorite)
scroll2.scrollHorizontal = false	

scroll1.x = -713
scroll1.states.add
	on:
		x:31
scroll1.states.animationOptions = curve: "spring(500,30,0)"		
scroll2.x = 31
scroll2.states.add
	on:
		x:781
scroll2.states.animationOptions = curve: "spring(500,30,0)"						

#icons, line
{SVGLayer} = require "SVGLayer"
star = new SVGLayer
  strokeWidth: 4
  width: 700
  height: 500
  stroke:"#515151"
  path: '<path d="M292.823563,339.389786 C292.823563,339.389786 595.012376,236.051472 608.784866,228.83005 C613.29427,226.465604 614.111878,224.251555 615.05797,222.323936 C617.642779,217.05751 617.642779,210.243904 612.533965,206.227981 C610.942467,204.976941 601.534176,199.139994 601.534176,199.139994 L585.481004,206.227983 C585.481004,206.227983 582.186732,208.103672 580.843803,207.362878 C579.500875,206.622084 579.81104,203.100284 579.81104,203.100284 L581.640739,184.590233 L569.825349,171.298691 C569.825349,171.298691 568.09781,169.392604 568.673249,167.904263 C569.248689,166.415922 571.333071,165.759754 571.333071,165.759754 L589.239356,161.048224 L597.862466,146.203495 C597.862466,146.203495 599.648304,143.090124 601.534176,143.133755 C603.420047,143.177386 605.305919,146.375703 605.305919,146.375703 L613.828995,161.048224 L615.057981,161.318365 L630.600209,165.349998 C630.600209,165.349998 633.832016,166.008957 634.395102,167.904263 C634.958188,169.79957 632.824864,171.980002 632.824864,171.980002 L621.427612,184.590233 L623.267029,203.198595 C623.267029,203.198595 623.4029,206.520712 622.224548,207.362878 C621.046196,208.205043 617.64278,206.227981 617.64278,206.227981"></path>'

star.x = -60
star.y = -240
star.originX = 1
star.originY = 0.5
star.opacity = 1
star.opacity = 1
star.rotation = -72	
star.dashOffset = -0.37
star.direction = "forward"

# 相机圈圈
{SVGLayer} = require "SVGLayer"
photo_cirle = new SVGLayer
  strokeWidth: 4
  width: 28
  height: 28
  stroke:"#515151"
  path: '<path d="M134.10507,109.85123 C134.722308,109.949146 135.355215,110 136,110 C142.627417,110 148,104.627417 148,98 C148,91.372583 142.627417,86 136,86 C129.372583,86 124,91.372583 124,98 C124,103.982632 127.643305,108.4138 133.13387,109.635592" id="Oval-1" stroke="#4A4A4A" stroke-width="3" fill="none"></path>'


photo_cirle.x = 132
photo_cirle.y = 76	

# 相机外框
{SVGLayer} = require "SVGLayer"
photo_outline = new SVGLayer
  strokeWidth: 4
  width: 595
  height: 361
  stroke:"#515151"
  path: '<path d="M641.733848,228.523606 C639.220782,227.956333 106.350482,84.8889162 95.8672279,81.4109576 C85.3839734,77.9329989 90.1098128,62.3529704 99.8150193,65.1068804 C112.795197,68.7900831 112.147371,63.3192333 112.147371,58.1301791 C112.147371,45.8394806 112.147371,33.8303967 112.147371,33.8303967 C112.147371,33.8303967 109.908085,18.3464768 127.627609,18.3464766 C127.627609,18.3464766 127.627609,6.72025105 138.69532,6.72025105 C147.313796,6.72025105 159.412588,6.72023877 161.021479,6.72025105 C169.917706,6.72031895 168.397374,16.4721147 169.917704,18.3464766 C188.004545,16.4721148 186.111013,31.7880001 186.111013,31.7880001 L186.111016,58.1301799 C186.111016,58.1301799 186.111016,68.6439135 175.406965,68.6439135 C175.406967,68.6439135 125.913552,68.6439135 125.913552,68.6439135 C125.913552,68.6439135 114.021187,70.1813357 115.438263,63.4310877"></path>'


    

#相机初始化值
photo_cirle.dashOffset = 0
photo_outline.dashOffset = 1
photo_outline.x =  -20
photo_outline.rotation = -14
photo_outline.originX = 0.7
photo_outline.originY = 0
photo_cirle.originX = -0.6
photo_cirle.originY = 0.13 
photo_cirle.rotation = -118
photo_outline.subLayers = photo_cirle
photo_outline.opacity = 1
photo_outline.dashOffset = 0.25
photo_outline.direction = "forward"
photo_cirle.opacity = 1

photo_outline.states.add
	on:
		dashOffset: -1
		time:1
	second:
		dashOffset: -0.27
		rotation:0
		originX : 0.5
		originY : 0.5
		x: -4
		y: 40	
photo_outline.states.animationOptions = curve: "spring(100, 22, 0)"

photo_cirle.states.add
	on:
		rotation:0
		dashOffset:1
		opacity:1
photo_cirle.states.animationOptions = curve: "spring(500, 90, 0)"

#states
TabB.states.add
	on:	
		opacity: 1		
TabB.states.animationOptions = curve: "spring(100,20,0)"	

TabA.states.add
	on:
		opacity: 0
TabB.states.animationOptions = curve: "spring(100,20,0)"	
	
# line.states.add
# 	on:
# 	    dashOffset:-0.36 
# line.states.animationOptions = curve: "spring(200, 50, 0)"


#star
star.states.add
	on:
	  rotation:-108
	  opacity:0
   dashOffset:0 
star.states.animationOptions = curve: "spring(300, 50, 0)"	  

TabA.onTap ->
	star.states.switch("on")
# 	line.states.switch("on",time:0.7)	
	photo_outline.states.switch("on",time:3)
	Utils.delay 0.5, ->
		photo_outline.states.switch("second")
	photo_cirle.states.switch("on")
	TabA.states.switch("on",time:0.16)
	TabB.states.switch("on",time:0.16)
	scroll1.states.switch("on")
 scroll2.states.switch("on")
TabB.onTap ->
	star.states.switch("default")
# 	line.states.switch("default",time:0.7)	
	photo_outline.states.switch("default")
	photo_cirle.states.switch("default")
	TabA.states.switch("default",time:0.16)
# 	Utils.delay 1, ->	
	TabB.states.switch("default",time:0.16)	
	scroll1.states.switch("default")
 scroll2.states.switch("default")