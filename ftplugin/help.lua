vim.cmd("wincmd L | let w = min([90, &columns / 2]) | execute 'vertical resize ' . w")
