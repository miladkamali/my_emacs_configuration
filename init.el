
;; this is the first init.el file i have ever created
;; for emacs <2013-04-03 Wed 15:30>  

;; this line is added for mac inorder for emacs to look at /opt/local/bin/
;;source:
;;http://www.moeding.net/archives/35-GNU-Emacs-and-GPGTool-on-Mac.html
(add-to-list 'exec-path "/opt/local/bin/")
;; to view the colume number next to line number
(column-number-mode 1)
;; i like to have this one but due to some bug in emacs on mac line numbers
;; on side do not apear currectly
(global-linum-mode 1)
;;to highlight block pair like () {}
(show-paren-mode 1)
;; a very good mode for switching buffers and opening files
(ido-mode 1)
;; to stop mouse from interfearing with work flow
(mouse-avoidance-mode "banish")


;;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; encryption section 
;;this part is related to gpg and work for files with .gpg extention

(require 'epa-file)
(epa-file-enable)
;; i assume i am gonna use symmetric algorithm otherwise you should 
;;load a public private key
(setq epa-file-select-keys nil) 


;;this part use ccrypt and it only uses symmetric algorithm 
;;this automatically is used for files with .cpt extention
(setq load-path (cons "~/.emacs.d/src/" load-path))
(require 'ps-ccrypt "ps-ccrypt.el")

;;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

;;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; adding org contacts
(require 'org-contacts "org-contacts.el")

;;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))



;;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; org-mode settings
;;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;enabling org-habits
(add-to-list 'org-modules 'org-habit)
(require 'org-habit)
;; sources of new org-mode
(add-to-list 'load-path "/home/milad/software/org-8.3.4/lisp/")
(add-to-list 'load-path "/home/milad/software/org-8.3.4/contrib/lisp")

;; Standard key bindings
(require 'org-install)
;; (require 'org-publish)

;;      (setq org-publish-project-alist
;;            '(("class"
;;               :base-directory "~/Desktop/class"
;;               :publishing-directory "~/Desktop/public_html"
;;               :section-numbers nil
;;               :with-toc nil
;; ;;	      :publishing-function org-publish-attachment
;; 	      :publishing-function org-html-publish-to-html
;; ;;	      :publishing-function org-publish-org-to-html
;; 	      )))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-use-fast-todo-selection t)
(setq org-log-done t)
(setq LOG_INTO_DRAWER t)
(setq log_into_drawer t)
;;next line to fix syntax hilighting in codeblocks
(setq org-src-fontify-natively t)
;; this line cause the timer to set it's time into a drawer called LOGBOOK
(setq org-clock-into-drawer "LOGBOOK")
(setq org-catch-invisible-edits 'error)

(setq org-todo-keywords
      (quote ((sequence "TODO(t!)" "NEXT(n!)" "|" "DONE(d!)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))

;; to change the start of each week 
(setq org-agenda-start-on-weekday 6)

;; this part sets the color of the keywords
(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "blue" :weight bold)
              ("TO_VERIFY" :foreground "blue" :weight bold)
              ("TO_WRITE" :foreground "orange" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("MEETING" :foreground "forest green" :weight bold)
              ("PHONE" :foreground "forest green" :weight bold))))


(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("cancelled" . t))
              ("WAITING" ("waiting" . t))
              ("HOLD" ("waiting") ("hold" . t))
	      ("NEXT" ("next" . t))
              (done ("waiting") ("next"))
              ("TODO" ("waiting") ("cancelled") ("hold") ("next"))
              ("NEXT" ("waiting") ("cancelled") ("hold") )
              ("WAITING" ("next") ("cancelled") ("hold") )
              ("CANCELLED" ("next") ("cancelled") ("hold") )
              ("DONE" ("waiting") ("cancelled") ("hold") ("next")))))

(setq org-agenda-files (quote (;;"~/Dropbox/orgs/english/english_studies.org"
;;                               "~/Dropbox/orgs/english/"
			       "~/Dropbox/orgs/projects/thesis.org"
			       "~/Dropbox/orgs/GTD/GTD.org"
			       "~/Dropbox/orgs/GTD/task.org"
			       "~/Dropbox/orgs/GTD/info.org"
			       "~/Dropbox/orgs/learnings/conferences.org"
			       "~/Dropbox/orgs/learnings/academic/academic_knowledge.org"
			       "~/Dropbox/orgs/learnings/linux_administration_class.org"
			       "/home/milad/Dropbox/orgs/english/words.org"
			       "/home/milad/Dropbox/orgs/english/GRE.org"
			       "~/Dropbox/orgs/GTD/people.org"
			       )
			)
)


;;org-tags
(setq org-tag-alist '(("@University" .?u)
		      ("@Work" . ?W) 
		      ("@Home" . ?h)
		      ("@Errand" . ?e)
		      ("@class" . ?k)
		      ("@computer" . ?c)
		      ("@fast_internet" . ?f)
		      ("to_read" . ?r)
		      ("to_watch" . ?w)
		      ("to_search" . ?s)
		      ("to_check" . ?t)
		      ("to_study" . ?y)
		      ("calls" . ?l)
		      ("communication" . ?m)
		      ("email" . ?i)
		      ("download" . ?d)
		      ("people" . ?p)))


;;**************org-capture mode 
(setq org-default-notes-file (concat org-directory "~/Dropbox/orgs/GTD/notes.org"))
(define-key global-map "\C-cc" 'org-capture)

     (setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Dropbox/orgs/GTD/task.org" "Tasks")
             "* TODO  %? \n     %a")
	("p" "Project" entry (file+headline "~/Dropbox/orgs/GTD/GTD.org" "projects")
	 "* %? \t :unprocessed: \n \t Inserted on: %t ")
        ("j" "Journal" entry (file+datetree "~/Dropbox/orgs/GTD/journal.org")
	 "* %?\nEntered on %U\n  %i\n ")
	("n" "note" entry (file+headline "~/Dropbox/orgs/GTD/notes.org" "notes")
	 "* %?  :note:unprocessed: ")
	("i" "info" entry (file+headline "~/Dropbox/orgs/GTD/info.org" "info")
	 "* %?   :unprocessed: \n  %i\n ")
	("d" "download" entry (file+headline "~/Dropbox/orgs/GTD/task.org" "one step tasks")
	 "* TODO %?  :download:")
	("1" "thesis chapter 1 Introduction" entry (file+headline "~/Dropbox/orgs/GTD/GTD.org" "my master thesis") "*  %?  :chapter1: ")
	("2" "thesis chapter 2 complex network" entry (file+headline "~/Dropbox/orgs/GTD/GTD.org" "my master thesis") "*  %?  :chapter2: ")
	("3" "thesis chapter 3 controllability" entry (file+headline "~/Dropbox/orgs/GTD/GTD.org" "my master thesis") "*  %?  :chapter3: ")
	("4" "thesis chapter 4 complex network controllability" entry (file+headline "~/Dropbox/orgs/GTD/GTD.org" "my master thesis") "*  %?  :chapter4: ")
	("5" "thesis chapter 5 map project" entry (file+headline "~/Dropbox/orgs/GTD/GTD.org" "my master thesis") "*  %?  :chapter5: ")
	("6" "thesis chapter 6 results" entry (file+headline "~/Dropbox/orgs/GTD/GTD.org" "my master thesis") "*  %?  :chapter6: ")
	("0" "thesis extras 4" entry (file+headline "~/Dropbox/orgs/GTD/GTD.org" "extras") "*  %?  ")
;;	("c" "new command" entry (file+headline "~/Dropbox/orgs/learnings/linux_administration_class.org" "commands") "*  %?  :unprocessed: ")
	))

;;

;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode)) 
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-css-colorization t)
(setq web-mode-enable-comment-keywords t)




;; python
;; (setq python-indent 4)
;; (add-hook 'python-mode-hook 'guess-style-guess-tabs-mode)
;; (add-hook 'python-mode-hook (lambda ()
;; 			      (when indent-tabs-mode
;; 				(guess-style-guess-tab-width)))


;; (smart-tabs-advice py-indent-line py-indent-offset)
;; (smart-tabs-advice py-newline-and-indent py-indent-offset)
;; (smart-tabs-advice py-indent-region py-indent-offset)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto-complete

(add-to-list 'load-path "~/.emacs.d/src")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/src/ac-dict")
(ac-config-default)

;; org-mode autocomplete
(require 'org-ac)
;; Make config suit for you. About the config item, eval the following sexp.
;; (customize-group "org-ac")
(org-ac/config-default)



;;;emacs pakage Manager
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))




;; emacsserver and client
;; to save the place of opened files from emacsclient 
(setq server-visit-hook (quote (save-place-find-file-hook)))
(require 'saveplace)
;;;;;




;;==========================cedet===============================
;; (global-ede-mode 1)
;; (require 'semantic/sb)
;; (semantic-mode 1)

;; (require 'cc-mode)
;; (require 'semantic)

;; (global-semanticdb-minor-mode 1)
;; (global-semantic-idle-scheduler-mode 1)

;; (semantic-mode 1)



  (defun save-macro (name)
    "save a macro. Take a name as argument
     and save the last defined macro under
     this name at the end of your .emacs"
     (interactive "SName of the macro :")  ; ask for the name of the macro
     (kmacro-name-last-macro name)         ; use this name for the macro
     (find-file user-init-file)            ; open ~/.emacs or other user init file
     (goto-char (point-max))               ; go to the end of the .emacs
     (newline)                             ; insert a newline
     (insert-kbd-macro name)               ; copy the macro
     (newline)                             ; insert a newline
     (switch-to-buffer nil))               ; return to the initial buffer

(fset 'fill_population
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([19 124 right 48 19 124 right 48 19 124 right 48 19 124 right 48 19 124 right 48 19 124 right 48 19 124 right 48 19 124 right 48 19 124 right 48 19 124 right 48 19 124 right 48 19 124 right 48 19 124 right 48 19 124 right 48 19 124 right 48 19 124 right 48 19 124 right 48 19 124 right 48 19 124 right 48 19 124 right 48 19 124 right 48 19 124 right 48 19 124 right 48 19 124 right 48 19 124 right 48 19 124 right 48 19 124 right 48 19 124 right 48 19 124 right 48 19 124 right 48 19 124 right 48 19 124 right 48 19 124 right 48 19 124 right 48 19 124 right 48 19 124 right 48 19 124 right 48 19 124 right 48 19 124 right 48 19 124 right 48 19 124 right 48 ] 0 "%d")) arg)))

