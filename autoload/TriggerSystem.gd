#触发器系统
extends Node

var triggerList=[]


func appendTrigger(trigger):
	triggerList.append(trigger)
func removeTrigger(trigger):
	if hasTrigger(trigger):
		triggerList.erase(trigger)
func hasTrigger(trigger):
	return triggerList.has(trigger)

func sendEvent(eventName,eventArg):
	#筛选出符合条件的trigger
	var avilableList=[]
	for trigger in triggerList:
		if trigger.event==eventName && trigger.condition(eventArg):
			avilableList.append(trigger)
	#调用trigger的行为
	for trigger in avilableList:
		trigger.action(eventArg)
	