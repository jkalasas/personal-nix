{
  config,
  pkgs,
  ...
}: let
  readFile = builtins.readFile;
in {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      # language servers
      emmet-ls
      nixd
      luaPackages.lua-lsp
      nodePackages.intelephense
      nodePackages.pyright
      nodePackages.svelte-language-server
      nodePackages.typescript-language-server
	  nodePackages.volar
      rust-analyzer

      # formatters
      alejandra # nix
      black # python
      prettierd # web stuff
      stylua # lua
      rustfmt

      # linters
      eslint_d

      # telescope
      chafa
      imagemagick
      ffmpegthumbnailer
      fd
      ripgrep

      # misc
      wl-clipboard
      xclip
    ];

    plugins = with pkgs.vimPlugins; [
      {
        plugin = bufferline-nvim;
        type = "lua";
        config = "require('bufferline').setup({})";
      }

      {
        plugin = catppuccin-nvim;
        type = "lua";
        config = readFile ./config/plugins/catppuccin.lua;
      }

      cmp_luasnip
      cmp-buffer
      cmp-nvim-lsp

      {
        plugin = comment-nvim;
        type = "lua";
        config = readFile ./config/plugins/comment.lua;
      }

      luasnip

      {
        plugin = null-ls-nvim;
        type = "lua";
        config = readFile ./config/plugins/null-ls.lua;
      }

      {
        plugin = nvim-autopairs;
        type = "lua";
        config = "require('nvim-autopairs').setup()";
      }

      {
        plugin = nvim-cmp;
        type = "lua";
        config = readFile ./config/plugins/cmp.lua;
      }

      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = readFile ./config/plugins/lsp.lua;
      }

      {
        plugin = nvim-tree-lua;
        type = "lua";
        config = readFile ./config/plugins/nvim-tree.lua;
      }

      {
        plugin = nvim-treesitter.withPlugins (p: [
          p.tree-sitter-nix
          p.tree-sitter-vim
          p.tree-sitter-bash
          p.tree-sitter-lua
          p.tree-sitter-markdown
          p.tree-sitter-markdown-inline
          p.tree-sitter-python
          p.tree-sitter-javascript
          p.tree-sitter-typescript
          p.tree-sitter-json
          p.tree-sitter-svelte
          p.tree-sitter-rust
        ]);
        type = "lua";
        config = readFile ./config/plugins/treesitter.lua;
      }

      {
        plugin = telescope-nvim;
        type = "lua";
        config = readFile ./config/plugins/telescope.lua;
      }
      telescope-fzf-native-nvim
      telescope-media-files-nvim

      vim-tmux-navigator
    ];

    extraLuaConfig = readFile ./config/options.lua;
  };
}
