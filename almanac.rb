class Almanac < Formula
  desc ""
  homepage ""
  url "https://github.com/tusharteji/almanac/archive/v1.0.0.tar.gz"
  sha256 "cfcbd878c3425c5ba741e5b2cdf9723285c4c79ed517cea1da6bcbd3e963863d"

  def install
    begin
      system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
      # system "cmake", ".", *std_cmake_args
      system "make", "install" # if this fails, try separate make/make install steps
    rescue
      bin.install "almanac"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test almanac`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
