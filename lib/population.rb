class Population
  attr_accessor :population
  def initialize(m,popSize,curriculum)
    day = Day.all.size
    hr = Lessonhour.all.size
    @mutationRate=m
    @population=Array.new
    i=0
    while i<popSize
      @population<<Dna.new(curriculum,day,hr)
      i = i+1
    end
    @matingPool=Array.new
    @fitness=Hash.new

  end

  def getpop(i)
    @population[i].getGen
  end

  #bütün populasyonun fitnesslerini hesapla
  def calcFitness
    i=0
    @fitness=Hash.new
    @population.each_with_index do |pop,index|
      @fitness[index] = pop.fitness
    end
    @population = @population.sort_by { |k| k.score }.reverse
    return @fitness
  end


  def naturalSelection
    # @population.sort_by! { |k| k.score }
    @matingpool=@population[0 , @population.length/2]
  end

  def reproduction
    i=0
    child = Array.new
    while i<@matingpool.length
      child += @matingpool[i].crossover(@matingpool[i+1])
      i += 2
    end
    child.each do |ch|
      @matingpool <<ch
    end
    # @matingpool += child
    @population = @matingpool

    y = 0
    while y<@population.length
      @population[y].mutation(@mutationRate)
      y += 1
    end
  end

  #en iyi ders programını getir
  def getBest
    max=0
    i=nil
    @population.each_with_index do |pop,index|
      fit=pop.fitness
      if(fit>max)
          i=index
          max=fit
      end
    end
    return pop[i]
  end
end
