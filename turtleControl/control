local mon = peripheral.wrap("monitor_0")
mon.setTextScale(1)
mon.setTextColor(colors. white)
local button = {}
mon.setBackgroundColor(colors.black)

function setTable(name, func, xmin, xmax, ymin, ymax)
  button[name] = {}
  button[name]["func"] = func
  button[name]["active"] = false
  button[name]["xmin"] = xmin
  button[name]["ymin"] = ymin
  button[name]["xmax"] = xmax
  button[name]["ymax"] = ymax
end

function func(arg)
  shell.run("action",arg)
end

function fillTable()
  setTable("/\\", func, 8, 11, 5, 7)
  setTable("\\/", func, 8, 11, 9, 11)
  setTable("<", func, 4, 6, 9, 11)
  setTable(">", func, 13, 15, 9, 11)
  setTable("D", func, 13, 15, 5, 7)
  setTable("DU", func, 13, 16, 2, 2)
  setTable("DD", func, 13, 16, 3, 3)
  setTable("A", func, 4, 6, 5, 7)
  setTable("AU", func, 3, 6, 2, 2)
  setTable("AD", func, 3, 6, 3, 3)
  setTable("UP", func, 8, 11, 2, 2)
  setTable("DW", func, 8, 11, 3, 3)
end

function fill(text, color, bData)
  mon.setBackgroundColor(color)
  local yspot = math.floor((bData["ymin"]+bData["ymax"])/2)
  local xspot = math.floor((bData["xmax"]-bData["xmin"]-string.len(text))/2+1)
  for j = bData["ymin"], bData["ymax"] do
    mon.setCursorPos(bData["xmin"], j)
    if j == yspot then
      for k = 0, bData["xmax"]-bData["xmin"]-string.len(text)+1 do
        if k == xspot then
          mon.write(text)
        else
          mon.write(" ")
        end
      end
    else
      for i = bData["xmin"], bData["xmax"] do
        mon.write(" ")
      end
    end
  end
  mon.setBackgroundColor(colors.black)
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

function heading(text)
  w, h = mon.getSize()
  mon.setCursorPos((w-string.len(text))/2+1, 1)
  mon.write(text)
end

fillTable()
mon.clear()
screen()
heading("Turtle's Console")
while true do
  local e, side, x, y = os.pullEvent("monitor_touch")
  checkxy(x,y)
  sleep(0.1)
end
