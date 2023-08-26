;; MINECRAFT RCON
(load-file (concat modes-config-directory "/mcf-mode/mcf-mode.el"))

;; RCON settings.
(setq 
 ;; If you want to write a password to your emacs settings file, just write.
 mcf-rcon-password "PASSWORD"
 ;; Default host address.
 mcf-rcon-address "localhost"
 ;; Default port number.
 mcf-rcon-port 25575
 ;; Describe packet information.
 mcf-rcon-print-packet-information t)