
require 'matrix'
m = Matrix.build(5, 5) {|row, col| ('a'..'z').to_a[rand(26)] }
class Dna
  #@@midpoint
  def initialize(curriculum,day,hr)
    rnd=Random.new
    @genes=Array.new(day+1){Array.new(hr)}
    curriculum.each do |cur|
      hour= Departmentlesson.find(cur[0].id).hour_amount
      i=1
      while i <= hour
        rday=rnd.rand(day-1)
        rhour=rnd.rand(hr-1)
          if !@genes[rday][rhour].nil?
            @genes[rday][rhour]=cur[0].departmentlesson.lesson.name
            i=i+1
          end
      end
    end
    # @genes=Matrix.build(Day.all.size, Lessonhour.all.size) {|row, col| curriculum[rand((Lessonhour.all.size*Day.all.size)-curriculum.size)] }
  end
  def getGen
    @genes
  end
  def crossover(partner)

  end

  def mutation(mRate)
  #  iki boyutlu dizide rasgele bir elemanı cirruculumdan başka bir eleman ile değiştir.
  end

  def fitness
    @score=0
    this.genes each do |gen|
      #score artır
    end
  end
end
