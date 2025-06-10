return {
    cmd = {
        "ngserver", "--stdio", "--tsProbeLocations", "../..,?/node_modules", "--ngProbeLocations",
        "../../@angular/language-server/node_modules,?/node_modules/@angular/language-server/node_modules",
        "--angularCoreVersion", ""
    },
    root_markers = { 'angular.json' },
    filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx", "htmlangular" },
}
