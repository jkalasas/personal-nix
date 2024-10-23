{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      # formatters
      esbenp.prettier-vscode
      ms-python.black-formatter

      # lsp
      ms-python.python
      prisma.prisma
      rust-lang.rust-analyzer
      svelte.svelte-vscode
      bmewburn.vscode-intelephense-client

      # etc
      ms-python.isort
    ];
  };
}
