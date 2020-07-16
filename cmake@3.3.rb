class CmakeAT33 < Formula
  desc "Cross-platform make"
  homepage "https://www.cmake.org"
  url "https://cmake.org/files/v3.3/cmake-3.3.2.tar.gz"
  sha256 "e75a178d6ebf182b048ebfe6e0657c49f0dc109779170bad7ffcb17463f2fc22"
  license ""

  def install
    args = %W[
      --prefix=#{prefix}
      --system-libs
      --mandir=/share/man
      --parallel=#{ENV.make_jobs}
      --docdir=/share/doc/cmake-3.3.2
    ]

    system "./bootstrap", *args
    system "make"
    system "make", "install"
  end

  test do
    (testpath/"CmakeLists.txt").write("find_package(Ruby)")
    system bin/"cmake", "."
  end
end
