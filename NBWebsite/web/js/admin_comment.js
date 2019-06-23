(function ($) {
    $("#table-comment tbody tr ").click(function () {
        $("#table-comment tbody").children(".red").toggleClass("red");
        $(this).toggleClass("red");
    });
    $("#select_all").change(function () {  //"select all" change 
        var status = this.checked; // "select all" checked status
        $('.checkbox').each(function () { //iterate all listed checkbox items
            this.checked = status; //change ".checkbox" checked status
        });
    });
    $('.checkbox').change(function () { //".checkbox" change 
        //uncheck "select all", if one of the listed checkbox item is unchecked
        if (this.checked == false) { //if this item is unchecked
            $("#select_all")[0].checked = false; //change "select all" checked status to false
        }

        //check "select all" if all checkbox items are checked
        if ($('.checkbox:checked').length == $('.checkbox').length) {
            $("#select_all")[0].checked = true; //change "select all" checked status to true
        }
    });
    $.fn.ddTableFilter = function (options) {
        options = $.extend(true, $.fn.ddTableFilter.defaultOptions, options);

        return this.each(function () {
            if ($(this).hasClass('ddtf-processed')) {
                refreshFilters(this);
                return;
            }
            var table = $(this);
            var start = new Date();

            $('th:visible', table).each(function (index) {
                if ($(this).hasClass('skip-filter'))
                    return;
                var selectbox = $('<select>');
                var values = [];
                var opts = [];
                selectbox.append('<option value="--all--">' + $(this).text() + '</option>');

                var col = $('tr:not(.skip-filter) td:nth-child(' + (index + 1) + ')', table).each(function () {
                    var cellVal = options.valueCallback.apply(this);
                    if (cellVal.length == 0) {
                        cellVal = '--empty--';
                    }
                    $(this).attr('ddtf-value', cellVal);

                    if ($.inArray(cellVal, values) === -1) {
                        var cellText = options.textCallback.apply(this);
                        if (cellText.length == 0) {
                            cellText = options.emptyText;
                        }
                        values.push(cellVal);
                        opts.push({val: cellVal, text: cellText});
                    }
                });
                if (opts.length < options.minOptions) {
                    return;
                }
                if (options.sortOpt) {
                    opts.sort(options.sortOptCallback);
                }
                $.each(opts, function () {
                    $(selectbox).append('<option value="' + this.val + '">' + this.text + '</option>')
                });

                $(this).wrapInner('<div style="display:none">');
                $(this).append(selectbox);

                selectbox.bind('change', {column: col}, function (event) {
                    var changeStart = new Date();
                    var value = $(this).val();

                    event.data.column.each(function () {
                        if ($(this).attr('ddtf-value') === value || value == '--all--') {
                            $(this).removeClass('ddtf-filtered');
                        } else {
                            $(this).addClass('ddtf-filtered');
                        }
                    });
                    var changeStop = new Date();
                    if (options.debug) {
                        console.log('Search: ' + (changeStop.getTime() - changeStart.getTime()) + 'ms');
                    }
                    refreshFilters(table);

                });
                table.addClass('ddtf-processed');
                if ($.isFunction(options.afterBuild)) {
                    options.afterBuild.apply(table);
                }
            });

            function refreshFilters(table) {
                var refreshStart = new Date();
                $('tr', table).each(function () {
                    var row = $(this);
                    if ($('td.ddtf-filtered', row).length > 0) {
                        options.transition.hide.apply(row, options.transition.options);
                    } else {
                        options.transition.show.apply(row, options.transition.options);
                    }
                });

                if ($.isFunction(options.afterFilter)) {
                    options.afterFilter.apply(table);
                }

                if (options.debug) {
                    var refreshEnd = new Date();
                    console.log('Refresh: ' + (refreshEnd.getTime() - refreshStart.getTime()) + 'ms');
                }
            }

            if (options.debug) {
                var stop = new Date();
                console.log('Build: ' + (stop.getTime() - start.getTime()) + 'ms');
            }
        });
    };

    $.fn.ddTableFilter.defaultOptions = {
        valueCallback: function () {
            return encodeURIComponent($.trim($(this).text()));
        },
        textCallback: function () {
            return $.trim($(this).text());
        },
        sortOptCallback: function (a, b) {
            return a.text.toLowerCase() > b.text.toLowerCase();
        },
        afterFilter: null,
        afterBuild: null,
        transition: {
            hide: $.fn.hide,
            show: $.fn.show,
            options: []
        },
        emptyText: '--Empty--',
        sortOpt: true,
        debug: false,
        minOptions: 2
    }

})(jQuery);
