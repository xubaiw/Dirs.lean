open System

-- TODO: non unix system

namespace Dirs

def getDirFromEnv? (s : String) (exts : List FilePath := []) : BaseIO $ Option FilePath := do
  if let some d ← IO.getEnv s then
    let d := exts.foldl (λ acc x => acc.join x) (FilePath.mk d)
    return if ←d.isDir then some d else none
  else return none

def home : BaseIO $ Option FilePath :=
  getDirFromEnv? "HOME"

def audio : BaseIO $ Option FilePath :=
  getDirFromEnv? "XDG_MUSIC_DIR"

def cache : BaseIO $ Option FilePath := do
  match ←getDirFromEnv? "XDG_CACHE_HOME" with
  | some d => return some d
  | _ => getDirFromEnv? "HOME" [".cache"]

def config : BaseIO $ Option FilePath := do
  match ←getDirFromEnv? "XDG_CONFIG_HOME" with
  | some d => return some d
  | _ => getDirFromEnv? "HOME" [".config"]

def data : BaseIO $ Option FilePath := do
  match ←getDirFromEnv? "XDG_DATA_HOME" with
  | some d => return some d
  | _ => getDirFromEnv? "HOME" [".local", "share"]

def dataLocal : BaseIO $ Option FilePath := do
  match ←getDirFromEnv? "XDG_DATA_HOME" with
  | some d => return some d
  | _ => getDirFromEnv? "HOME" [".local", "share"]

def desktop : BaseIO $ Option FilePath :=
  getDirFromEnv? "XDG_DESKTOP_DIR"

def document : BaseIO $ Option FilePath :=
  getDirFromEnv? "XDG_DOCUMENTS_DIR"

def download : BaseIO $ Option FilePath :=
  getDirFromEnv? "XDG_DOWNLOAD_DIR"

def executable : BaseIO $ Option FilePath := do
  match ←getDirFromEnv? "XDG_BIN_HOME" with
  | some d => return some d
  | _ => getDirFromEnv? "HOME" [".local", "bin"]

def font : BaseIO $ Option FilePath := do
  match ←getDirFromEnv? "XDG_BIN_HOME" ["fonts"] with
  | some d => return some d
  | _ => getDirFromEnv? "HOME" [".local", "share", "fonts"]

def picture : BaseIO $ Option FilePath :=
  getDirFromEnv? "XDG_PICTURES_DIR"

def preference : BaseIO $ Option FilePath := do
  match ←getDirFromEnv? "XDG_CONFIG_HOME" ["fonts"] with
  | some d => return some d
  | _ => getDirFromEnv? "HOME" [".config"]

def public : BaseIO $ Option FilePath := 
  getDirFromEnv? "XDG_PUBLICSHARE_DIR"

def runtime : BaseIO $ Option FilePath :=
  getDirFromEnv? "XDG_RUNTIME_DIR"

def state : BaseIO $ Option FilePath := do
  match ←getDirFromEnv? "XDG_STATE_HOME" ["fonts"] with
  | some d => return some d
  | _ => getDirFromEnv? "HOME" [".local", "state"]

def template : BaseIO $ Option FilePath :=
  getDirFromEnv? "XDG_TEMPLATES_DIR"

def video: BaseIO $ Option FilePath :=
  getDirFromEnv? "XDG_VIDEOS_DIR"

end Dirs
