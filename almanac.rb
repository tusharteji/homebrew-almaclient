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
  end

  test do
    system "false"
  end

end
