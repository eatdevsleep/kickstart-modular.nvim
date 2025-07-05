return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-neotest/nvim-nio',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-neotest/neotest-plenary',
    'nvim-neotest/neotest-vim-test',
    'nvim-neotest/neotest-python', -- or another adapter like neotest-jest, neotest-go, etc.
  },
  config = function()
    require('neotest').setup {
      adapters = {
        require 'neotest-python' {
          dap = { justMyCode = false },
          runner = 'pytest', -- or "unittest"
        },
        require 'neotest-plenary',
        require 'neotest-vim-test' {
          ignore_file_types = { 'python', 'vim', 'lua' },
        },
      },
    }
    vim.keymap.set('n', '<leader>tn', function()
      require('neotest').run.run()
    end, { desc = 'Run nearest test' })
    vim.keymap.set('n', '<leader>tf', function()
      require('neotest').run.run(vim.fn.expand '%')
    end, { desc = 'Run file tests' })
    vim.keymap.set('n', '<leader>ts', function()
      require('neotest').summary.toggle()
    end, { desc = 'Toggle test summary' })
    vim.keymap.set('n', '<leader>to', function()
      require('neotest').output.open()
    end, { desc = 'Show test output' })
  end,
}
