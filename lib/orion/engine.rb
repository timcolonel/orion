module Orion::Engine
  def self.manager
    Orion::Engine::ScriptManager.instance
  end
end