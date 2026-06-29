return {
  "nvim-orgmode/orgmode",
  config = function()
    require("orgmode").setup({
      org_agenda_files = { "~/Dropbox/org-notes/**/*" },
      org_default_notes_file = "~/Dropbox/org-notes/refile.org",
      org_directory = "~/Dropbox/org-notes/",
    })
  end,
}
