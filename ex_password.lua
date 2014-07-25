-- Thanks for use the program 
--by Xia_ST

term.setTextColor(colors. white)
local button = {}
term.setBackgroundColor(colors.black)
local password = "1024"
local input = ""

function setTable(name, func, xmin, xmax, ymin, ymax)
  button[name] = {}
  button[name]["func"] = func
  button[name]["active"] = false
  button[name]["xmin"] = xmin
  button[name]["ymin"] = ymin
  button[name]["xmax"] = xmax
  button[name]["ymax"] = ymax
end

function heading(text)
  w, h = term.getSize()
  term.setCursorPos((w-string.len(text))/2+1, 1)
  term.write(text)
end

function func(arg)
	if arg>='0' and arg<= '9' then
		input = input .. arg
	elseif arg == 'C' then
		input = ""
	elseif arg == 'E' then
		if input == password then
			heading	("                                                   ")
			heading("Welcome back, Master!")
			input = ""
			rs.setOutput("bottom", true)
			sleep(5)
			rs.setOutput("bottom",false)
			heading("                                                   ")
			heading("Please input the password")
		else
			heading	("                                                   ")
			heading("wrong password")
			input = ""
			sleep(1)
			heading("                                                   ")
			heading("Please input the password")
		end
	end 
end

function fillTable()
  setTable("7", func, 18, 22, 3, 5)
  setTable("8", func, 24, 28, 3, 5)
  setTable("9", func, 30, 34, 3, 5)
  setTable("4", func, 18, 22, 7, 9)
  setTable("5", func, 24, 28, 7, 9)
  setTable("6", func, 30, 34, 7, 9)
  setTable("1", func, 18, 22, 11, 13)
  setTable("2", func, 24, 28, 11, 13)
  setTable("3", func, 30, 34, 11, 13)
  setTable("C", func, 18, 22, 15, 17)
  setTable("0", func, 24, 28, 15, 17)
  setTable("E", func, 30, 34, 15, 17)
end

function fill(text, color, bData)
  term.setBackgroundColor(color)
  local yspot = math.floor((bData["ymin"]+bData["ymax"])/2)
  local xspot = math.floor((bData["xmax"]-bData["xmin"]-string.len(text))/2+1)
  for j = bData["ymin"], bData["ymax"] do
    term.setCursorPos(bData["xmin"], j)
    if j == yspot then
      for k = 0, bData["xmax"]-bData["xmin"]-string.len(text)+1 do
        if k == xspot then
          term.write(text)
        else
          term.write(" ")
        end
      end
    else
      for i = bData["xmin"], bData["xmax"] do
        term.write(" ")
      end
    end
  end
  term.setBackgroundColor(colors.black)
end

function screen()
  local currColor
  for name, data in pairs(button) do
    currColor = colors.lime
    fill(name, currColor, data)
  end
end

function checkxy(x, y)
  for name, data in pairs(button) do
    if y>=data["ymin"] and y<=data["ymax"] then
      if x>=data["xmin"] and x<=data["xmax"] then
        data["func"](name)
	  end
    end
  end
end


fillTable()
term.clear()
screen()
heading("Please input the password")
while true do
  local e, side, x, y = os.pullEvent("mouse_click")
  checkxy(x,y)
  sleep(0.1)
end
