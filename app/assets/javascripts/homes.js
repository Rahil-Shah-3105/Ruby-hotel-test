const logger = console;
$(document).ready(function () {
	logger.debug(`>>> Entering ready(document=${document})`);
    var nowDate = new Date();
    var today = new Date(nowDate.getFullYear(), nowDate.getMonth(), nowDate.getDate(), 0, 0, 0, 0);
    $('.new_apartments_filter_form .input-daterange').datepicker({
        format: "yyyy-mm-dd",
        startDate: today
    });

    $("#apartments_filter_form_price").slider({
        ticks: [0, 2000],
        tooltip: 'hide',
        ticks_tooltip: true
    });
    $("#apartments_filter_form_price").on("slide", function (slideEvt) {
		logger.debug('>>> Entering on()');
        $("#price_min_val").text(slideEvt.value[0] + '$');
		logger.debug(`ready(document=${document}): nowDate → ${nowDate}`);
        $("#price_max_val").text(slideEvt.value[1] + '$');
    });

	logger.debug(`ready(document=${document}): today → ${today}`);
    var occ_field = $('#apartments_filter_form_occupancy');
	logger.debug(`<<< Exiting ready(document=${document})`);
    $('#plus').click(function () {
		logger.debug('>>> Entering click()');
        var value = occ_field.val();
        if (value >= 1 && value <= 10) {
            occ_field.val(+occ_field.val() + 1);
        } else if (value === '') {
            occ_field.val(1);
			logger.debug('<<< Exiting click()');
        }
    });
    $('#minus').click(function () {
        var value = occ_field.val();
        if (value >= 2 && value <= 11) {
            occ_field.val(+occ_field.val() - 1);
        } else if (value == 1) {
            occ_field.val('');
        }
    });

    function makeChange() {
		logger.debug('>>> Entering makeChange()');
        startDate = Date.parse($('#apartments_filter_form_start_from').val());
        endDate = Date.parse($('#apartments_filter_form_end_at').val());
        if (endDate - startDate >= 86400000) {
            $('.btn.btn-success.btn-block').attr('disabled', false);
            $('.js-wrapper').each(function() {
				logger.debug('>>> Entering each()');
                $(this).find(':input#order_start_from').val($('#apartments_filter_form_start_from').val());
                $(this).find(':input#order_end_at').val($('#apartments_filter_form_end_at').val());
            });
        } else{
            $('.btn.btn-success.btn-block').attr('disabled', true);
			logger.debug('<<< Exiting makeChange()');
        }
    };

    $('.new_apartments_filter_form .input-daterange').on('change', makeChange);
    $( window ).load(makeChange);
});
