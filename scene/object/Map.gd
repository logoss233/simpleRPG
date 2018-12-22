#大地图 里面有site(地点)  玩家棋子也在这里面移动
extends Node2D
class_name Map
const START_POSITION=Vector2(65,360) #起始site的位置
const END_POSITION=Vector2(1200,360) #结束site的位置
const ROAD_WIDTH=200 #路的宽度
const ROAD_LONG=8 #走完路程要走几个site

var tscn_site=preload("res://scene/object/Site.tscn")

#------属性
var startSite:Site
var endSite:Site
var levelList=[] #保存每一层(不包括起点和终点)   每一层（level）有多个site 
#leve是array，形式 [null,site,site,null,null,site]
#引用
var sitePlace:Node2D
var linePlace:Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	sitePlace=$Sites
	linePlace=$Lines
	
	
	createSite()
	connectAllSites()
	
	
	pass # Replace with function body.

#生成地点
func createSite():
	
	
	#生成起始点
	var site:Site
	site=tscn_site.instance()
	sitePlace.add_child(site)
	site.mingzi="起始点"
	site.position=START_POSITION
	startSite=site
	#依次生成中间站点
	#遍历每一层
	for i in range(1,ROAD_LONG-1):
		var level=[null,null,null,null,null,null] #保存这一层的site
		#每一层随机生成2-6个site
		#先决定生成site的个数
		var number=4 
		var r=randf()
		if r<0.2:
			number=2
		elif r<0.5:
			number=3
		elif r<0.7:
			number=4
		elif r<0.9:
			number=5
		else:
			number=6
		#在site分配到这一层(level)中
		for j in range(0,number):
			#获取这个level中随机一个空的位置
			var index=_getListRandomEmptyIndex(level)
			#如果没有空的位置了，跳出
			if index==-1:
				break
			else:
				#生成一个site
				site=tscn_site.instance()
				sitePlace.add_child(site)
				site.mingzi="中间点"
				#分配
				level[index]=site
				#调整位置
				var x=(END_POSITION.x-START_POSITION.x)/(ROAD_LONG-1)*i+START_POSITION.x
				var y=(2*ROAD_WIDTH)/5*index+START_POSITION.y-ROAD_WIDTH
				site.position=Vector2(x,y)
		levelList.append(level)
	#生成终点
	site=tscn_site.instance()
	sitePlace.add_child(site)
	site.mingzi="终点"
	site.position=END_POSITION
	endSite=site
	
	
	
	pass
	
#按规则连接所有site
func connectAllSites():
	#首先连接起点和level0的所有site
	var level=levelList[0]
	for site in level:
		if site!=null:
			connectSite(startSite,site)
	#把中间的level连接起来
	for i in range(levelList.size()-1):
		#获取一层level
		level=levelList[i]
		#获取下一层level
		var levelNext=levelList[i+1]
		#先清理没有preSite的site
		for j in range(level.size()):
			var site:Site=level[j]
			if site!=null:
				if site.preSiteList.size()==0:
					site.queue_free()
					level[j]=null
		#遍历site，连接到下一层site
		for j in range(level.size()):
			var site:Site=level[j]
			if site==null:
				break
			#查看相邻的site,放入nearSiteList 相邻是指下一层的编号和这一层编号在+1 0 -1之间的
			var nearSiteList=[]
			if j-1>=0 && levelNext[j-1]!=null:
				nearSiteList.append(levelNext[j-1])
			if levelNext[j]!=null:
				nearSiteList.append(levelNext[j])
			if j+1<level.size() && levelNext[j+1]!=null:
				nearSiteList.append(levelNext[j+1])
			
			
			
			pass
		
	
	
	#把最后的level和终点连接
	level=levelList.back()
	for site in level:
		if site!=null:
			connectSite(site,endSite)
	
	


#--------------------辅助函数-------------
#给两个地点连线，site1是出发点，site2是目的地
func connectSite(site1:Site,site2:Site):
	#改变数据
	site1.nextSiteList.append(site2)
	site2.preSiteList.append(site1)
	#画线
	var line=Line2D.new()
	linePlace.add_child(line)
	line.width=5
	line.add_point(site1.get_rightConnectPosition())
	line.add_point(site2.get_leftConncetPosition())
	
	pass
#从一个list中选出所有null的项目，把他们的index放到一个新的list中返回
func _getListEmptyIndexes(list:Array):
	var result=[]
	for i in range(list.size()):
		if list[i]==null:
			result.append(i)
	return result

#从一个list中随机选出一个null的项目，返回它的index.如果没有null的项目,则返回-1
func _getListRandomEmptyIndex(list:Array):
	var indexList=_getListEmptyIndexes(list)
	if indexList.size()==0:
		return -1
	else:
		var r=floor(rand_range(0,indexList.size()))
		return indexList[r]
