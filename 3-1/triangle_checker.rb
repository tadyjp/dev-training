class TriangleChecker

  # 入力された3つの数字を三角形の辺の長さとして、その三角形が「不等辺三角形」「二等辺三角形」「正三角形」のうちどれであるかを判定する。
  # ただし、三角形として無効な組み合わせが入力された場合は、`false`を返すこととする。
  def check(a, b, c)

    if a == b && b == c
      return "正三角形"
    end

  end

end
