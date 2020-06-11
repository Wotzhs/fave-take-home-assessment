require "socket"
require "cgi"
require "json"
require_relative "employee"

server = TCPServer.new 5678

def get_salary_breakdown(query)
  employee = Employee.new(query["employee_name"], query["annual_salary"].to_f)
  return JSON.pretty_generate({
    "employee_name" => employee.name,
    "gross_monthly_income" => "%0.2f" % employee.compute_monthly_income,
    "monthly_income_tax" => "%0.2f" % employee.compute_monthly_tax,
    "net_monthly_income" => "%0.2f" % employee.compute_net_monthly_income,
  })
end

def writeResponse(session, status, body)
  session.print "HTTP/1.1 %d\r\n" % [status]
  session.print "Content-Type: application/json\r\n"
  session.print "\r\n"
  session.print body
end

puts "Server listening at localhost:5678"

while session = server.accept
  request = session.gets
  puts request

  method, full_path = request.split(" ")

  if method != "GET"
    writeResponse(session, 405, "405 Method Not Allowed")
    next
  end
  
  path, query = full_path.split("?")

  if path != "/"
    writeResponse(session, 404, "404 Bad Request")
    next
  end

  query = CGI.parse(query||"").transform_values(&:first)
  if query["employee_name"].length < 1 || query["annual_salary"].length < 1
    writeResponse(session, 404, "404 Bad Request")
    next;
  end

  writeResponse(session, 200, get_salary_breakdown(query))

  session.close
end