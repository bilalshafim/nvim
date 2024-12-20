local M = {}

M.get_dashboard_header = function()
  local handle = io.popen("git rev-parse --is-inside-work-tree 2>/dev/null")
  local result = handle:read("*a")
  handle:close()

  if result:match("true") then
    local onefetch_handle = io.popen("onefetch .")
    local onefetch_output = onefetch_handle:read("*a")
    onefetch_handle:close()
    return vim.split(onefetch_output, "\n")
  else
    return {
      "⣿⣿⣿⣿⣿⡿⡛⠕⡡⣪⡞⡟⡏⣿⢻⣻⣿⣟⣷⠙⣩⢫⢵⣫⡝⣻⣖⣭⣪⣵⣻⡿⠟⠻⢷⣻⢿⡿⣿⣿⣿⡾⡽⣾⣏⣼⣯⣷⠒⠸",
      "⣿⣿⣿⣿⠏⢊⣴⣶⣵⣿⣧⠀⢃⢏⣾⣿⣽⣿⣷⣢⢾⣷⣿⣷⣿⣏⢿⣿⣿⣿⣿⣿⣷⢴⣬⣿⣮⢔⡠⣚⡵⣫⢷⣣⢣⣼⣿⣿⣿⣧",
      "⣿⣿⢟⠵⠡⣿⡟⣿⣿⠁⣿⢰⣿⣾⣿⣿⣿⣿⣿⡿⣿⣿⣿⢿⣿⣿⣧⡻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣾⣷⣷⣿⣿⣿⣿⣿",
      "⡿⢣⢋⠂⠀⠘⢃⢿⠇⠀⢯⣿⣿⣿⣿⣿⣿⣿⣿⣿⡹⣿⣿⣷⣿⣿⣿⣿⣵⡈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
      "⡕⣹⡄⣦⣼⣷⢸⣿⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡙⠻⣿⣿⣿⢿⣿⣿⣦⣀⣉⣿⣿⣿⡿⠿⠿⣯⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
      "⣴⠉⣷⣿⣿⣿⢾⡿⠀⠀⠀⠈⢿⣿⣟⢿⣾⣿⣿⣿⣿⣿⣿⣢⣀⠉⣙⡷⠿⠛⠛⠋⠉⠉⠀⠀⠀⠀⠀⠈⠙⠋⠿⣿⣿⣿⣿⣿⣿⣿",
      "⣿⣠⣿⣿⣿⣿⢺⣟⠀⠀⠀⠀⠈⠻⢝⣦⣙⠻⢟⣺⣭⠭⠍⠉⠁⠀⠀⠀⠀⠀⠀⠀⣀⣤⣶⣤⣀⠀⠀⠀⠀⠀⠀⠀⠉⢿⣿⡿⠋⠉",
      "⣿⣿⣿⣿⣿⣿⣿⣿⠀⢀⣠⠤⠴⠒⠛⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠈⠉⠀⢀⠄",
      "⡽⣿⣿⣷⣿⣿⣷⢿⡄⠉⠀⠀⠀⠀⢀⣤⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡁",
      "⣮⡛⢟⣾⣛⠯⣻⣯⣷⡀⠀⠀⠀⢰⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⢸",
      "⣿⣿⣷⣮⣭⣓⠢⠍⠳⠈⠀⠀⠀⠘⢿⣿⣿⣿⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠊⠀⠀⠀⠀⠀⠀⠀⢠⠧",
      "⣿⣿⣿⣿⣿⡇⡇⢀⠸⢇⠀⠀⠀⠀⠀⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⣿⣿⣿⣿⣿⡇⡇⠈⠄⡘⡄⠀⡀⠀⠀⠀⠀⠀⠀⢀⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀",
      "⣿⣿⣿⣿⣿⣇⢇⠀⡀⡇⣷⠀⠈⠢⠄⣀⣀⠠⠒⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣗⣿",
      "⣿⣿⣿⣿⣿⣿⣮⡢⠀⡇⡇⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣻",
      "⣿⣿⣿⣿⣿⣿⣿⣷⣕⠆⢦⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⣿⣿⣿",
      "⣿⣿⣿⣿⣿⣿⣿⣿⣿⢠⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⢹⣿⣿",
      "⣿⣿⣿⣿⣿⣿⣿⣿⣿⢸⣿⣿⣿⡗⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠄⠀⠀⠀⠘⣿⡿",
      "⣿⣿⣿⣿⣿⣿⣿⣿⣿⢰⣿⣿⣿⠃⡾⠓⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠾⠁⠀⠀⠀⠀⠀⠹⡖",
      "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠘⢿⣿⢠⠃⢸⣷⣮⣕⠦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⡴⣼⠅⠀⠀⠀⠀⠀⠀⠀⠈⣿",
      "⣿⣿⣿⣿⣿⣿⣿⣿⣿⡧⠀⠘⢻⢸⢀⡾⣿⣿⣿⣿⣶⣭⡳⢢⠤⣀⡀⠀⠀⠀⠀⠀⢀⣀⣤⡶⡷⣹⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹",
      "⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠄⣸⢸⣿⢸⡇⣿⣿⣿⣿⣿⣿⣇⠎⣷⢹⣿⣿⣿⣿⣿⢿⣿⣿⣿⠿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣾⡟⣼⢻⢸⡇⣿⣿⣿⣿⣿⣿⣿⡜⠜⣷⣘⢮⣀⣻⣿⣽⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀",
      "⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿⢸⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣎⠹⢿⣦⣙⢿⣿⣮⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠙",
      "⣿⣿⣿⣿⣿⣿⣿⣿⣿⡧⣿⣿⣿⡿⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⡶⠌⣚⠡⠤⠠⠉⠫⢍⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠄⢴⣼⠀⠀",
    }
  end
end

return M
