class Dna
  #@@midpoint
  def initialize
    @genes=Array.new(Lessonhour.all.size){Array.new(Day.all.size)}
    #bu arrayın içi rasgele weeklyschedule nesneleriyle doldurulacak
  end

  def crossover(partner)

  end

  def mutation(MRate)
  #  iki boyutlu dizide rasgele bir elemanı cirruculumdan başka bir eleman ile değiştir.
  end

  def fitness
    #bu fonksiyon dna nın uygunluk durumuna göre bir fitness değeri atıyacak
  end
end
