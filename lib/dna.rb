class Dna
  #@@midpoint
  def initialize(curriculum)
    @genes=Array.new(Day.all.size){Array.new(Lessonhour.all.size)}
    #ornek
    @genes[0][0]=curriculum[0]
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
