local status, dbee = pcall(require, "dbee")
if not status then
	return
end
dbee.setup()
