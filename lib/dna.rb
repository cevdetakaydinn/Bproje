
require 'matrix'
m = Matrix.build(5, 5) {|row, col| ('a'..'z').to_a[rand(26)] }
class Dna
  #@@midpoint
  def initialize(curriculum)
    @genes=Matrix.build(Day.all.size, Lessonhour.all.size) {|row, col| curriculum[rand((Lessonhour.all.size*Day.all.size)-curriculum.size)] }
    #ornek

    #Rasgele doldurulacak
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
    #bu fonksiyon dna nın uygunluk durumuna göre bir fitness değeri atıyacak
  end
end
