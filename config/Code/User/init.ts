import * as vscode from "vscode";
import { initUsePackage, usePackage } from "vscode-use-package";

export function init(context: vscode.ExtensionContext) {
    const config = vscode.workspace.getConfiguration();
    config.update("workbench.editor.showTabs", false, vscode.ConfigurationTarget.Global);
    config.update("editor.minimap.enabled", false, vscode.ConfigurationTarget.Global);
    config.update("editor.wordWrap", "wordWrapColumn", vscode.ConfigurationTarget.Global);
    config.update("editor.wordWrapColumn", 100, vscode.ConfigurationTarget.Global);

    config.update("remote.SSH.defaultExtensions", ["bodil.init-script"]);
    
    initUsePackage(context);

    usePackage("jack-pallot.atom-dark-syntax", {
        globalConfig: { "workbench.colorTheme": "Atom Dark Syntax" },
    });

    usePackage("bodil.file-browser", {
        keymap: [
            {
                key: "ctrl+o",
                command: "file-browser.open",
            }
        ]
    });

    usePackage("garaemon.vscode-emacs-tab", {
        scope: "emacs-tab",
        keymap: [
            {
                key: "tab",
                command: "emacs-tab.reindentCurrentLine",
                when: "editorTextFocus",
            },
        ],
    });

/*     usePackage("tuttieee.emacs-mcx");
 */
    usePackage("kahole.magit");
    usePackage("github.vscode-pull-request-github");
    usePackage("eamodio.gitlens");
    usePackage("donjayamanne.githistory");
    usePackage("streetsidesoftware.code-spell-checker");
    usePackage("coenraads.bracket-pair-colorizer-2");
    usePackage("wayou.vscode-todo-highlight");
    usePackage("ms-vscode-remote.vscode-remote-extensionpack");
    usePackage("vscode-icons-team.vscode-icons", {
        globalConfig: { "workbench.iconTheme": "vscode-icons"},
    });

    usePackage("ms-python.python");

    usePackage("ikuyadeu.r");
    
    usePackage("rust-lang.rust");

    usePackage("imjacobclark.vscode-lisp-formatter");

    usePackage("ms-vscode.vscode-typescript-tslint-plugin");
}
