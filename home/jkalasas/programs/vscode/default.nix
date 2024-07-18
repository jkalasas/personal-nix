{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      # formatters
      esbenp.prettier-vscode
      ms-python.black-formatter

      # lsp
      ms-python.python
	  rust-lang.rust-analyzer
      svelte.svelte-vscode

      # etc
      ms-python.isort
    ];
  };
}
