return {
	_fold = true,
	_id = "gameFSM1",
	height = "$fill",
	width = "$fill",
	_children = {	   {
	      FSMNode_default = 0,
	      FSMNode_state = "INIT",
	      _fold = true,
	      _id = "fSMNode1",
	      _isWidget = 0,
	      _lock = 0,
	      _type = "gk/layout/FSMNode",
	      height = 30,
	      scaleX = "$minScale",
	      scaleY = "$minScale",
	      width = 100,
	      x = 108,
	      y = 462,
	      anchor = {
	         x = 0.5,
	         y = 0.5},
	      scaleXY = {
	         x = "$scaleX",
	         y = "$scaleY"}},
	   {
	      FSMNode_state = "RUNNING",
	      _fold = true,
	      _id = "fSMNode3",
	      _isWidget = 0,
	      _lock = 0,
	      _type = "gk/layout/FSMNode",
	      height = 30,
	      scaleX = "$minScale",
	      scaleY = "$minScale",
	      width = 100,
	      x = 428,
	      y = 186,
	      anchor = {
	         x = 0.5,
	         y = 0.5},
	      scaleXY = {
	         x = "$scaleX",
	         y = "$scaleY"}},
	   {
	      FSMNode_state = "PAUSED",
	      _fold = true,
	      _id = "fSMNode4",
	      _isWidget = 0,
	      _lock = 0,
	      _type = "gk/layout/FSMNode",
	      height = 30,
	      scaleX = "$minScale",
	      scaleY = "$minScale",
	      width = 100,
	      x = 602,
	      y = 615,
	      anchor = {
	         x = 0.5,
	         y = 0.5},
	      scaleXY = {
	         x = "$scaleX",
	         y = "$scaleY"}},
	   {
	      FSMNode_state = "WIN",
	      _fold = true,
	      _id = "fSMNode5",
	      _isWidget = 0,
	      _lock = 0,
	      _type = "gk/layout/FSMNode",
	      height = 30,
	      scaleX = "$minScale",
	      scaleY = "$minScale",
	      width = 100,
	      x = 1048,
	      y = 349,
	      anchor = {
	         x = 0.5,
	         y = 0.5},
	      scaleXY = {
	         x = "$scaleX",
	         y = "$scaleY"}},
	   {
	      FSMNode_state = "LOSE",
	      _fold = true,
	      _id = "fSMNode6",
	      _isWidget = 0,
	      _lock = 0,
	      _type = "gk/layout/FSMNode",
	      height = 30,
	      scaleX = "$minScale",
	      scaleY = "$minScale",
	      width = 100,
	      x = 830,
	      y = 186,
	      anchor = {
	         x = 0.5,
	         y = 0.5},
	      scaleXY = {
	         x = "$scaleX",
	         y = "$scaleY"}},
	   {
	      FSMTransNode_action = "start",
	      FSMTransNode_from = "INIT",
	      FSMTransNode_to = "RUNNING",
	      _fold = true,
	      _id = "fSMTransNode2",
	      _isWidget = 0,
	      _lock = 0,
	      _type = "gk/layout/FSMTransNode",
	      height = 50,
	      scaleX = "$minScale",
	      scaleY = "$minScale",
	      width = 50,
	      x = 368,
	      y = 442,
	      scaleXY = {
	         x = "$scaleX",
	         y = "$scaleY"}},
	   {
	      FSMTransNode_action = "pause",
	      FSMTransNode_from = "RUNNING",
	      FSMTransNode_to = "PAUSED",
	      _fold = true,
	      _id = "fSMTransNode3",
	      _isWidget = 0,
	      _lock = 0,
	      _type = "gk/layout/FSMTransNode",
	      height = 50,
	      scaleX = "$minScale",
	      scaleY = "$minScale",
	      width = 50,
	      x = 388,
	      y = 442,
	      scaleXY = {
	         x = "$scaleX",
	         y = "$scaleY"}},
	   {
	      FSMTransNode_action = "win",
	      FSMTransNode_from = "RUNNING",
	      FSMTransNode_to = "WIN",
	      _fold = true,
	      _id = "fSMTransNode4",
	      _isWidget = 0,
	      _lock = 0,
	      _type = "gk/layout/FSMTransNode",
	      height = 50,
	      scaleX = "$minScale",
	      scaleY = "$minScale",
	      width = 50,
	      x = 408,
	      y = 442,
	      scaleXY = {
	         x = "$scaleX",
	         y = "$scaleY"}},
	   {
	      FSMTransNode_action = "resume",
	      FSMTransNode_from = "PAUSED",
	      FSMTransNode_to = "RUNNING",
	      _fold = true,
	      _id = "fSMTransNode5",
	      _isWidget = 0,
	      _lock = 0,
	      _type = "gk/layout/FSMTransNode",
	      height = 50,
	      scaleX = "$minScale",
	      scaleY = "$minScale",
	      visible = 0,
	      width = 50,
	      x = 428,
	      y = 442,
	      scaleXY = {
	         x = "$scaleX",
	         y = "$scaleY"}},
	   {
	      FSMTransNode_action = "lose",
	      FSMTransNode_from = "RUNNING",
	      FSMTransNode_to = "LOSE",
	      _fold = true,
	      _id = "fSMTransNode6",
	      _isWidget = 0,
	      _lock = 0,
	      _type = "gk/layout/FSMTransNode",
	      height = 50,
	      scaleX = "$minScale",
	      scaleY = "$minScale",
	      width = 50,
	      x = 448,
	      y = 442,
	      scaleXY = {
	         x = "$scaleX",
	         y = "$scaleY"}},
	   {
	      FSMTransNode_action = "reset",
	      FSMTransNode_from = "RUNNING",
	      FSMTransNode_to = "INIT",
	      _fold = true,
	      _id = "fSMTransNode7",
	      _isWidget = 0,
	      _lock = 0,
	      _type = "gk/layout/FSMTransNode",
	      height = 50,
	      scaleX = "$minScale",
	      scaleY = "$minScale",
	      width = 50,
	      x = 468,
	      y = 442,
	      scaleXY = {
	         x = "$scaleX",
	         y = "$scaleY"}},
	   {
	      FSMTransNode_action = "reset",
	      FSMTransNode_from = "PAUSED",
	      FSMTransNode_to = "INIT",
	      _fold = true,
	      _id = "fSMTransNode1",
	      _isWidget = 0,
	      _lock = 0,
	      _type = "gk/layout/FSMTransNode",
	      height = 50,
	      scaleX = "$minScale",
	      scaleY = "$minScale",
	      width = 50,
	      x = 488,
	      y = 442,
	      scaleXY = {
	         x = "$scaleX",
	         y = "$scaleY"}},
	   {
	      FSMTransNode_action = "reset",
	      FSMTransNode_from = "WIN",
	      FSMTransNode_to = "INIT",
	      _fold = true,
	      _id = "fSMTransNode8",
	      _isWidget = 0,
	      _lock = 0,
	      _type = "gk/layout/FSMTransNode",
	      height = 50,
	      scaleX = "$minScale",
	      scaleY = "$minScale",
	      width = 50,
	      x = 508,
	      y = 442,
	      scaleXY = {
	         x = "$scaleX",
	         y = "$scaleY"}},
	   {
	      FSMTransNode_action = "reset",
	      FSMTransNode_from = "LOSE",
	      FSMTransNode_to = "INIT",
	      _fold = true,
	      _id = "fSMTransNode9",
	      _isWidget = 0,
	      _lock = 0,
	      _type = "gk/layout/FSMTransNode",
	      height = 50,
	      scaleX = "$minScale",
	      scaleY = "$minScale",
	      width = 50,
	      x = 528,
	      y = 442,
	      scaleXY = {
	         x = "$scaleX",
	         y = "$scaleY"}}}}