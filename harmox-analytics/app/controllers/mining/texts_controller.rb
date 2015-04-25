require 'natto'

class Mining::TextsController < ApplicationController
  def show
    @text = <<"EOS"
雇用保険は、
労働者が失業した場合及び労働者について雇用の継続が困難となる事由が生じた場合に必要な給付を行うほか、
労働者が自ら職業に関する教育訓練を受けた場合に必要な給付を行うことにより、
労働者の生活及び雇用の安定を図るとともに、
求職活動を容易にする等その就職を促進し、
あわせて、
労働者の職業の安定に資するため、
失業の予防、
雇用状態の是正及び雇用機会の増大、
労働者の能力の開発及び向上その他労働者の福祉の増進を図ることを目的とする。
この目的を達するために、
失業等給付を行うほか、
二事業（雇用安定事業、能力開発事業）を行う（第1条、第3条）。
雇用保険法において、
「離職」とは、
被保険者について、
事業主との雇用関係が終了することをいう。
「失業」とは、
被保険者が離職し、
労働の意思及び能力を有するにもかかわらず、
職業に就くことができない状態にあることをいう（第4条）。
EOS

    create_text
  end

  private
    def create_text
      @word = {}
      nm = Natto::MeCab.new.parse(@text) do |n|
        @word[n.surface] = n.feature unless n.nil? || n.surface.nil? || n.feature.nil?
      end
    end
end
