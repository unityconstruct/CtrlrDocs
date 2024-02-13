
--### This function start a timer after panel load and calls the function timerInitCallback to fill values of the panel ###


callBackInit = function()

		
	timer:setCallback (1, timerInitCallback)
	timer:startTimer(1, 1500)

	
end