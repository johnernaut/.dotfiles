vim.keymap.set("n", "<leader>pv", "<cmd>Ex<CR>")
vim.keymap.set("i", "fd", "<Esc>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")

local function copy_test_command()
  local file_path = vim.fn.expand('%:r')
  local module_path = file_path:gsub("/", "."):gsub("apps%.",""):gsub("%.py", "")

  local class_name = nil
  local test_name = nil
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local cursor_pos = vim.fn.line('.')

  for i, line in ipairs(lines) do
    -- Match the class name but not the inheritance part
    local class_match = line:match("^class%s+(%w+)")
    if class_match then
      class_name = class_match
    end
    -- Match any method name, not just those starting with "test"
    local method_match = line:match("^%s*def%s+(%w+[%w_]+)%(")
    if method_match and i < cursor_pos then
      -- Update test_name only if the line number is less than the cursor position
      test_name = method_match
    end
  end

  if class_name and test_name then
    local test_command = module_path .. "." .. class_name .. "." .. test_name
    vim.fn.setreg('+', test_command)
  else
    print("Class or method not found in the current buffer.")
  end
end

_G.copy_test_command = copy_test_command -- Expose to the global scope for calling in vim

-- Map the key combination
vim.api.nvim_set_keymap('n', '<leader>ct', ':lua copy_test_command()<CR>', { noremap = true, silent = true })

