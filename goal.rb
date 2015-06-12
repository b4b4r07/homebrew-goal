HOMEBREW_GOAL_VERSION='0.0.1'
class Goal < Formula
  homepage 'https://github.com/b4b4r07/goal'
  url 'https://github.com/b4b4r07/goal.git', :tag => "v#{HOMEBREW_GOAL_VERSION}"
  version HOMEBREW_GOAL_VERSION
  head 'https://github.com/b4b4r07/goal.git', :branch => 'master'

  depends_on 'go' => :build
  depends_on 'hg' => :build

  def install
    ENV['GOPATH'] = buildpath
    system 'go', 'get', 'github.com/BurntSushi/toml'
    system 'go', 'get', 'github.com/mitchellh/colorstring'
    system 'go', 'get', 'github.com/kyokomi/emoji'
    mkdir_p buildpath/'src/github.com/b4b4r07/goal'
    ln_s buildpath/'search', buildpath/'src/github.com/b4b4r07/goal/.'
    system 'go', 'build', '-o', 'goal'
    bin.install 'goal'
  end
end
