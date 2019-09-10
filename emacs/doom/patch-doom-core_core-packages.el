diff --git a/core/core-packages.el b/core/core-packages.el
index dff6e7f4..58370c1e 100644
--- a/core/core-packages.el
+++ b/core/core-packages.el
@@ -53,7 +53,8 @@ missing) and shouldn't be deleted.")
       ;; I omit Marmalade because its packages are manually submitted rather
       ;; than pulled, so packages are often out of date with upstream.
       package-archives
-      `(("gnu"          . "https://elpa.gnu.org/packages/")
+      ;;`(("gnu"          . "https://elpa.gnu.org/packages/") ;; refer from: https://github.com/hlissner/doom-emacs/issues/444
+      `(("gnu"          . "https://mirrors.163.com/elpa/gnu/")
         ("melpa"        . "https://melpa.org/packages/")
         ("org"          . "https://orgmode.org/elpa/")))
 
