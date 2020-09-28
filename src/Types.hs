module Types where 

import qualified Graphics.UI.GLFW             as GLFW
import qualified Graphics.Rendering.OpenGL.GL as GL
import Control.Monad.State.Lazy
import Control.Lens

import Graphics.UI.HamGui.BitMapFont
import Graphics.UI.HamGui.Types

data Program = Program {
    _program :: Maybe GL.Program,
    _bufferArray :: Maybe GL.BufferObject,
    _bufferElement :: Maybe GL.BufferObject,
    _bufferStorage :: Maybe GL.BufferObject
  }
$(makeLenses ''Program)

data InputEvent = 
    KeyEvent GLFW.Key
  | MouseEvent Double Double

data GameState = GameState 
  {
    _windowHandle :: GLFW.Window,
    _hamGuiState  :: HamGuiData,
    _programMain  :: Program,
    _programHG    :: Program,
    _bitmapfont   :: BitMapFont
  }
makeLenses ''GameState

type Game a = StateT GameState IO a